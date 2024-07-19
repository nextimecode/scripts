#!/bin/sh

# Import the constants
source /Users/pedroduarte/dev/scripts/constants.sh

echo "\n${INFO}Executing pnpm install${RESET}"
  pnpm install
# echo "\n${INFO}Executing pnpm build${RESET}"
#   pnpm build
echo "\n${INFO}Executing pnpm skaldic-next:dev${RESET}"
  pnpm skaldic-next:dev
