# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

echo "${INFO}Executing bundle exec rails s -p 3001${RESET}"
  pnpm install
  pnpm build
  bundle exec rails s -p 3001
