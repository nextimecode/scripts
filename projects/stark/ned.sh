#!/bin/sh

# Import the constants
source /Users/pedroduarte/dev/scripts/constants.sh

echo "\n${INFO}Executing pnpm install${RESET}"
  pnpm install
echo "\n${INFO}Executing pnpm build${RESET}"
  pnpm build
echo "${INFO}Executing pnpm bran:dev${RESET}"
  pnpm ned:dev
