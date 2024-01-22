# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

echo "${INFO}Executing pnpm odin:dev${RESET}"
  pnpm install
  pnpm build
  pnpm dev:odin
