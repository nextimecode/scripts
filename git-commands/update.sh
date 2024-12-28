#!/bin/sh

# Import the constants
source /Users/pedroduarte/dev/scripts/constants.sh

echo "\n${INFO}Executing pnpm update --latest --force${RESET}"
  pnpm update --latest --force
echo "\n${INFO}Executing pnpm install${RESET}"
  pnpm i
echo "\n${INFO}Executing pnpm build${RESET}"
  pnpm build
