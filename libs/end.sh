#!/bin/sh

# Start time
START_TIME=$(date +%s)

# Import the constants
source /Users/pedroduarte/dev/scripts/constants.sh

diff_output=$(git diff | jq -R -s .)

export $(grep -v '^#' /Users/pedroduarte/dev/scripts/.env | xargs)

if [ -z "$1" ]; then
  printf "\n${ERROR}${IA_EMOJI} No commit message provided. Generating one using git diff...${RESET}\n"

  response=$(curl -s https://api.openai.com/v1/chat/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d '{
      "model": "gpt-4o-mini",
      "messages": [
        {"role": "system", "content": "Im going to provide you with a git diff output. Based on the changes shown, generate a concise commit message in English that follows conventional commit guidelines. The commit message should be a single sentence and clearly describe the purpose of the changes. Here is the git diff:"},
        {"role": "user", "content": '"$diff_output"'}
      ]
    }')

  commit_message=$(echo "$response" | jq -r '.choices[0].message.content')

  if [ -z "$commit_message" ]; then
    printf "\n${ERROR}❌ Error: Failed to generate a commit message automatically.${RESET}\n"
    read -p "Please enter a commit message: " commit_message
    if [ -z "$commit_message" ]; then
      printf "\n${ERROR}❌ Error: Commit message is still missing. Exiting.${RESET}\n"
      exit 1
    fi
  else
    printf "\n${WARNING}${IA_EMOJI} Generated commit message:${RESET} ${commit_message}${RESET}\n"
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
  printf "${SUCCESS}No unstaged changes.${RESET}\n"
fi

printf "\n${INFO}Executing the git commit command${RESET}\n"
git commit -m "$commit_message" $NO_VERIFY && { printf "${SUCCESS}Changes committed successfully.${RESET}\n"; } || { printf "${ERROR}❌ Error: Failed to commit changes.${RESET}\n"; exit 1; }


printf "\n${INFO}Checking for uncommitted changes...${RESET}\n"
if [ -n "$(git diff --staged)" ]; then
  printf "${WARNING}${WARNING_EMOJI} Warning: There are uncommitted changes.${RESET}\n"
  exit 1
else
  printf "${SUCCESS}No uncommitted changes.${RESET}\n"
fi

printf "\n${INFO}Executing the git push command${RESET}\n\n"

git push $NO_VERIFY && { printf "${SUCCESS}\n✅ Congratulations, Pedro! Changes pushed successfully.${RESET}\n\n"; } || { printf "${ERROR}\n❌ Error: Failed to push changes.${RESET}\n"; exit 1; }

# Calculate elapsed time
  END_TIME=$(date +%s)
  ELAPSED_TIME=$((END_TIME - START_TIME))

printf "${INFO}Time taken: ${ELAPSED_TIME} seconds.${RESET}\n\n"

# Open the Pull Request page --------------------------------

# Check the number of arguments provided
if [ "$#" -eq 0 ]; then
    # Attempt to open the current branch's PR in the web browser using the GitHub CLI
    printf "${INFO}Checking if there is an open Pull Request for the current branch...${RESET}\n"
    # Capture the output and exit code of `gh pr view --web`
    output=$(gh pr view 2>&1)
    exit_code=$?

    # Check if the command was successful
    if [ $exit_code -eq 0 ]; then
        # If the PR was found and the view command was successful
        printf "${INFO}There is already an open Pull Request for the current branch. Opening it in your browser...${RESET}\n"
    else
        printf "\n${ERROR}${ERROR_EMOJI} Error: $output${RESET}\n"
        # If no PR was found, try to create one
        if echo "$output" | grep -q "no pull requests found"; then
            gh pr create && gh pr view --web
        fi
    fi
    exit 0
elif [ "$#" -ne 1 ]; then
    # Error message if more than one argument or incorrect usage
    printf "${ERROR}${ERROR_EMOJI} Error: Only one argument is allowed${RESET}\n"
    exit 1
fi



