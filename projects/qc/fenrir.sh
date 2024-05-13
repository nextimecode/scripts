# Import the constants
source /Users/pedroduarte/dev/scripts/constants.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

echo "${INFO}Executing cd /Users/pedroduarte/dev/qc/odin${RESET}"
  cd /Users/pedroduarte/dev/qc/fenrir
echo "\n${INFO}Executing bundle install${RESET}"
  bundle install
echo "\n${INFO}Executing bundle exec rails s -p 8000${RESET}"
  bundle exec rails s -p 8000
