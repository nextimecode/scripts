#!/bin/sh

# Import the constants
source /Users/pedroduarte/dev/scripts/constants.sh

# Check the number of arguments provided
if [ "$#" -eq 0 ]; then
    # Attempt to open the current branch's PR in the web browser using the GitHub CLI
    printf "${INFO}Opening the current Pull Request in the web browser...${RESET}\n"
    # Capture the output and exit code of `gh pr view --web`
    output=$(gh pr view --web 2>&1)
    exit_code=$?

    # Check if the command was successful
    if [ $exit_code -ne 0 ]; then
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

# Project name
PROJETO=$1

# List of qcx projects
QCX_PROJECTS=("artemis" "kori" "kratos" "olimpo" "sleipnir" "odin" "finn")

# Determine if the project is a qcx project
IS_QCX_PROJECT=false
for QCX_PROJ in "${QCX_PROJECTS[@]}"; do
    if [ "$PROJETO" == "$QCX_PROJ" ]; then
        IS_QCX_PROJECT=true
        break
    fi
done

# Open the Pull Requests page based on the domain
# Check if the project is Rohan
if [ "$PROJETO" = "rohan" ]; then
    printf "${INFO}Opening the Pull Requests for project ${BRIGHT_PURPLE}%s${INFO} on GitHub under domain rohannextime...${RESET}\n" "$PROJETO"
    open -a "Google Chrome" "https://github.com/rohannextime/web/pulls"
    exit 0
fi
if [ "$IS_QCX_PROJECT" = true ]; then
    printf "${INFO}Opening the Pull Requests for project ${BRIGHT_PURPLE}%s${INFO} on GitHub under domain qcx...${RESET}\n" "$PROJETO"
    open -a "Google Chrome" "https://github.com/qcx/$PROJETO/pulls"
else
    printf "${INFO}Opening the Pull Requests for project ${BRIGHT_PURPLE}%s${INFO} on GitHub under domain nextimecode...${RESET}\n" "$PROJETO"
    open -a "Google Chrome" "https://github.com/nextimecode/$PROJETO/pulls"
fi
