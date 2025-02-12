#!/bin/sh

# Start time
START_TIME=$(date +%s)

# Import the constants
source /Users/pedroduarte/dev/scripts/constants.sh

# Máximo de tokens permitido pela API
MAX_TOKENS=128000

# Obter o git diff e garantir que o JSON seja válido após truncar
diff_output=$(git diff | jq -Rs .)

# Remover caracteres de controle do JSON (U+0000 a U+001F)
diff_output=$(echo "$diff_output" | tr -d '\000-\037')

# Verificar o tamanho do diff_output e truncar se necessário
if [ ${#diff_output} -gt "$MAX_TOKENS" ]; then
  truncated_diff=$(echo "$diff_output" | head -c $MAX_TOKENS)
  diff_output=$(echo "$truncated_diff" | jq -Rs .)
fi

export $(grep -v '^#' /Users/pedroduarte/dev/scripts/.env | xargs)

if [ -z "$1" ]; then
  printf "\n${ERROR}${IA_EMOJI} No commit message provided. Generating one using git diff...${RESET}\n"

  # Criar o payload JSON corretamente
  payload=$(jq -n \
    --arg model "gpt-4o-mini" \
    --arg role "system" \
    --arg system_msg "Im going to provide you with a git diff output. Based on the changes shown, generate a concise commit message in English that follows conventional commit guidelines. The commit message should be a single sentence and clearly describe the purpose of the changes, and must not exceed 100 characters. Here is the git diff:" \
    --arg user_content "$diff_output" \
    '{
      model: $model,
      messages: [
        {role: $role, content: $system_msg},
        {role: "user", content: $user_content}
      ]
    }')

  # Enviar o payload para a API
  response=$(curl -s https://api.openai.com/v1/chat/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $Q_API_KEY" \
    -d "$payload")

  echo "$response"

  commit_message=$(echo "$response" | jq -r '.choices[0].message.content')

  if [ -z "$commit_message" ] || [ "$commit_message" = "null" ]; then
    printf "\n${ERROR}❌ Error: Failed to generate a commit message automatically.${RESET}\n"

    while [ -z "$commit_message" ] || [ "$commit_message" = "null" ]; do
      read -p "${WARNING_EMOJI} Please enter a commit message: " commit_message
      if [ -z "$commit_message" ] || [ "$commit_message" = "null" ]; then
        printf "\n${WARNING}${WARNING_EMOJI} Commit message cannot be empty. Please provide a valid message.${RESET}\n"
      fi
    done
  else
    printf "\n${WARNING}${IA_EMOJI} Generated commit message:\n${RESET} ${CYAN}${commit_message}${RESET}\n"
  fi
else
  commit_message="$1"
  printf "\n${SUCCESS}Using provided commit message: ${commit_message}${RESET}\n"
fi

# Aqui você pode continuar com o processo de commit usando a variável commit_message

# Check for --no-verify flag
NO_VERIFY=""
for arg in "$@"; do
  if [ "$arg" = "--no-verify" ]; then
    NO_VERIFY="--no-verify"
    break
  fi
done

printf "\n${INFO}Executing the git add -A command...${RESET}\n"
git add -A && { printf "${SUCCESS}Changes added successfully.${RESET}\n"; } || { printf "${ERROR}❌ Error: Failed to add changes.${RESET}\n"; exit 1; }

printf "\n${INFO}Checking for unstaged changes...${RESET}\n"
if [ -n "$(git diff)" ]; then
  printf "${WARNING}${WARNING_EMOJI} Warning: There are unstaged changes.${RESET}\n"
  exit 1
else
  printf "No unstaged changes.${RESET}\n"
fi

printf "\n${INFO}Executing the git commit command${RESET}\n"
git commit -m "$commit_message" $NO_VERIFY && { printf "${SUCCESS}Changes committed successfully.${RESET}\n"; } || { printf "${ERROR}❌ Error: Failed to commit changes.${RESET}\n"; exit 1; }

printf "\n${INFO}Checking for uncommitted changes...${RESET}\n"
if [ -n "$(git diff --staged)" ]; then
  printf "${WARNING}${WARNING_EMOJI} Warning: There are uncommitted changes.${RESET}\n"
  exit 1
else
  printf "No uncommitted changes.${RESET}\n"
fi

printf "\n${INFO}Executing the git push command${RESET}\n\n"

git push $NO_VERIFY && { printf "${SUCCESS}\n✅ Congratulations, Pedro! Changes pushed successfully.${RESET}\n\n"; } || { printf "${ERROR}\n❌ Error: Failed to push changes.${RESET}\n"; exit 1; }

# Open the Pull Request page --------------------------------

# Check the number of arguments provided
if [ "$#" -eq 0 ]; then
    # Attempt to open the current branch's PR in the web browser using the GitHub CLI
    printf "\n${WARNING}${IA_EMOJI} Commit message: ${RESET}${CYAN}${commit_message}${RESET}\n"
    printf "\n${INFO}${CHECKING_EMOJI} Checking if there is an open Pull Request for the current branch...${RESET}\n"
    # Capture the output and exit code of `gh pr view --web`
    output=$(gh pr view 2>&1)
    exit_code=$?

    # Check if the command was successful
    if [ $exit_code -eq 0 ]; then
        # If the PR was found and the view command was successful
        printf "There is already an open Pull Request for the current branch${RESET}\n\n"
    else
        printf "\n${ERROR}${ERROR_EMOJI} Error: $output${RESET}\n\n"
        # If no PR was found, try to create one
        if echo "$output" | grep -q "no pull requests found"; then
          gh pr create --assignee @me && gh pr view --web
        fi
        printf "\n"
    fi
    exit 0
elif [ "$#" -ne 1 ]; then
    # Error message if more than one argument or incorrect usage
    printf "${ERROR}${ERROR_EMOJI} Error: Only one argument is allowed${RESET}\n\n"
    exit 1
fi

# Calculate elapsed time
  END_TIME=$(date +%s)
  ELAPSED_TIME=$((END_TIME - START_TIME))

printf "${INFO}${CLOCK_EMOJI}  Time taken:${RESET} ${ELAPSED_TIME} seconds.${RESET}\n"
