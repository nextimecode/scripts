# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

echo "${INFO}Executing cd /Users/pedroduarte/Dev/qc/odin${RESET}"
  cd /Users/pedroduarte/Dev/qc/odin
echo "\n${INFO}Executing nvm use 16${RESET}"
  nvm use 18
echo "\n${INFO}Executing pnpm install${RESET}"
  pnpm install
echo "\n${INFO}Executing pnpm build${RESET}"
  pnpm build
echo "\n${INFO}Executing pnpm dev:odin${RESET}"
  pnpm dev:odin

