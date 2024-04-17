#!/bin/sh

# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

echo "\n${INFO}Executing pnpm install${RESET}"
  pnpm install
echo "\n${INFO}Executing pnpm build${RESET}"
  pnpm build
echo "${INFO}Executing pnpm dunharrow:dev${RESET}"
  pnpm dunharrow:dev
