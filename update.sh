#!/bin/sh

# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

echo "${INFO}Executing pnpm i and pnpm update --latest...${RESET}"
pnpm i
pnpm update --latest
