#!/bin/sh

# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

echo "${INFO}Executing install, build and westfold:dev${RESET}"
  pnpm install
  pnpm build
  pnpm westfold:dev
