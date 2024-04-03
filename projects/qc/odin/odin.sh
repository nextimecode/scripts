# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

cd /Users/pedroduarte/Dev/qc/odin

echo "${INFO}Executing the redis-server${RESET}"
  osascript -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down'
  osascript -e 'tell application "Terminal" to do script "cd /Users/pedroduarte/Dev/qc/odin" in selected tab of the front window'
  osascript -e 'tell application "Terminal" to do script "redis-server" in selected tab of the front window'

  echo "${INFO}Executing the odin front${RESET}"
  osascript -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down'
  osascript -e 'tell application "Terminal" to do script "cd /Users/pedroduarte/Dev/qc/odin" in selected tab of the front window'
  osascript -e 'tell application "Terminal" to do script "odinf" in selected tab of the front window'

  echo "${INFO}Executing the odin back${RESET}"
  osascript -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down'
  osascript -e 'tell application "Terminal" to do script "cd /Users/pedroduarte/Dev/qc/odin" in selected tab of the front window'
  osascript -e 'tell application "Terminal" to do script "odinb" in selected tab of the front window'

