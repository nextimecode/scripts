# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

echo "${INFO}Executing bundle exec rails s -p 3000${RESET}"
  nvm use 16
  pnpm install
  pnpm build
  bundle exec rails s -p 3000
