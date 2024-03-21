# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

echo "${INFO}Executing bundle exec rails s -p 3001${RESET}"
  nvm use 16
  pnpm install
  bundle install
  pnpm build
  bundle exec rails s -p 3001
