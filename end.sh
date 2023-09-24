#!/bin/sh

# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

if [ -z "$1" ]; then
  printf "\n${ERROR}❌ Error: Commit message is missing.${RESET}\n"
  exit 1
fi

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
git commit -m "$1" && { printf "${SUCCESS}Changes committed successfully.${RESET}\n"; } || { printf "${ERROR}❌ Error: Failed to commit changes.${RESET}\n"; exit 1; }


printf "\n${INFO}Checking for uncommitted changes...${RESET}\n"
if [ -n "$(git diff --staged)" ]; then
  printf "${WARNING}${WARNING_EMOJI} Warning: There are uncommitted changes.${RESET}\n"
  exit 1
else
  printf "${SUCCESS}No uncommitted changes.${RESET}\n"
fi

printf "\n${INFO}Executing the git push command${RESET}\n\n"

git push && { printf "${SUCCESS}\n✅ Congratulations, Pedro! Changes pushed successfully.${RESET}\n\n"; } || { printf "\n\n${ERROR}\n\n❌ Error: Failed to push changes.${RESET}\n\n"; exit 1; }
