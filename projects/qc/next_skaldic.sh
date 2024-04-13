#!/bin/sh

# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

echo "${INFO}Executing install, build and skaldic-next:dev${RESET}"
  pnpm install
  pnpm build
  pnpm skaldic-next:dev
