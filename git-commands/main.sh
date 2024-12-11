# Import the constants
source /Users/pedroduarte/dev/scripts/constants.sh

echo "${INFO}Executing git checkout main${RESET}"
  git checkout main
echo "\n${INFO}Executing git pull origin main${RESET}"
  git pull origin main
echo "\n${INFO}Executing pnpm install${RESET}"
  pnpm install
