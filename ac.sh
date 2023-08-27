#!/bin/sh

# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

if [ -z "$1" ]; then
  printf "\n${ERROR} Error: Commit message is missing.${RESET}\n"
  exit 1
fi

printf "\n${EXECUTING} Executing the git add -A command...${RESET}\n"
git add -A && { printf "${SUCCESS} Success: Changes added successfully.${RESET}\n"; } || { printf "${ERROR} Error: Failed to add changes.${RESET}\n"; exit 1; }


printf "\n${CHECKING} Checking for unstaged changes...${RESET}\n"
if [ -n "$(git diff)" ]; then
  printf "${WARNING} Warning: There are unstaged changes.${RESET}\n"
  exit 1
else
  printf "${SUCCESS} Success: No unstaged changes.${RESET}\n"
fi

printf "\n${EXECUTING} Executing the git commit command${RESET}\n"
git commit -m "$1" && { printf "${SUCCESS} Success: Changes committed successfully.${RESET}\n"; } || { printf "${ERROR} Error: Failed to commit changes.${RESET}\n"; exit 1; }


printf "\n${CHECKING} Checking for uncommitted changes...${RESET}\n"
if [ -n "$(git diff --staged)" ]; then
  printf "${WARNING} Warning: There are uncommitted changes.${RESET}\n"
  exit 1
else
  printf "${SUCCESS} Success: No uncommitted changes.${RESET}\n"
fi

printf "\n${EXECUTING} Executing the git push command${RESET}\n"
git push && { printf "${SUCCESS} Success: Changes pushed successfully.${RESET}\n"; } || { printf "${ERROR} Error: Failed to push changes.${RESET}\n"; exit 1; }


printf "\n${SUCCESS} All changes have been committed and pushed successfully.${RESET}\n"
