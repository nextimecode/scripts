# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

echo "${INFO}Executing pnpm atreus:dev${RESET}"
  pnpm install
  pnpm build
  pnpm dev:odin
