# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

cd /Users/pedroduarte/Dev/qc/odin

echo "${INFO}Executing pnpm odin:dev${RESET}"
  nvm use 16
  pnpm install
  pnpm build
  pnpm dev:odin

