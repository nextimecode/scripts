#!/bin/sh

# Import the constants
source /Users/pedroduarte/dev/scripts/constants.sh

echo "\n${INFO}Executing pnpm install${RESET}"
  pnpm install
echo "${INFO}Executing pnpm skaldic:dev${RESET}"
  pnpm skaldic:dev
