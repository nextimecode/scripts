#!/bin/sh

# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

echo "\n${INFO}Executing pnpm update --latest${RESET}"
  pnpm update --latest
echo "\n${INFO}Executing pnpm install${RESET}"
  pnpm i
echo "\n${INFO}Executing pnpm build${RESET}"
  pnpm build
