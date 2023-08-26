#!/bin/sh

# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

# Start of the Script
printf "\n${BLUE}Executing the git add -A command${RESET}\n"
git add -A

printf "\n${PURPLE}Executing the git status command${RESET}\n"
git status

printf "\n${CYAN}Checking for unstaged changes...${RESET}\n"
if [ -n "$(git diff)" ]; then
  printf "\n${YELLOW}Warning: There are unstaged changes.${RESET}\n"
  exit 1
fi

printf "\n${BLUE}Executing the git commit command${RESET}\n"
git commit -m "$1"

printf "\n${CYAN}Checking for uncommitted changes...${RESET}\n"
if [ -n "$(git diff --staged)" ]; then
  printf "\n${YELLOW}Warning: There are uncommitted changes.${RESET}\n"
  exit 1
fi

printf "\n${PURPLE}Executing the git status command${RESET}\n"
git status

printf "\n${BLUE}Executing the git push command${RESET}\n"
git push

printf "\n${GREEN}All changes have been committed and pushed successfully.${RESET}\n"
