#!/bin/sh

# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

# Argument passed to the script
drive_type=$1

if [ "$drive_type" = "atreus" ]; then
  target_dir=/Users/pedroduarte/Dev/qc/kratos

  if [ "$(pwd)" != "$target_dir" ]; then
    echo "${INFO}Changing directory to $target_dir${RESET}"
    cd "$target_dir"
  fi

  echo "${INFO}Executing the the pnpm i && pnpm atreus:dev${RESET}"
  pnpm i
  pnpm atreus:dev

elif [ "$drive_type" = "skaldic" ]; then
  target_dir=/Users/pedroduarte/Dev/qc/kratos

  if [ "$(pwd)" != "$target_dir" ]; then
    echo "${INFO}Changing directory to $target_dir${RESET}"
    cd "$target_dir"
  fi

  echo "${INFO}Executing the pnpm i && pnpm skaldic:dev${RESET}"
  pnpm i
  pnpm skaldic:dev

elif [ "$drive_type" = "odin" ]; then
  echo "${INFO}Executing the redis-server${RESET}"
  osascript -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down'
  osascript -e 'tell application "Terminal" to do script "cd /Users/pedroduarte/Dev/qc-old/odin" in selected tab of the front window'
  osascript -e 'tell application "Terminal" to do script "redis-server" in selected tab of the front window'

  sleep 5

  echo "${INFO}Executing the yarn dev:odin${RESET}"
  osascript -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down'
  osascript -e 'tell application "Terminal" to do script "cd /Users/pedroduarte/Dev/qc-old/odin" in selected tab of the front window'
  osascript -e 'tell application "Terminal" to do script "yarn dev:odin" in selected tab of the front window'

  sleep 80

  echo "${INFO}Executing the rails s -p 3003 -b 0.0.0.0${RESET}"
  osascript -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down'
  osascript -e 'tell application "Terminal" to do script "cd /Users/pedroduarte/Dev/qc-old/odin" in selected tab of the front window'
  osascript -e 'tell application "Terminal" to do script "rails s -p 3003 -b 0.0.0.0" in selected tab of the front window'

else
  echo "${INFO}Executing the pnpm i && pnpm dev...${RESET}"
  pnpm i
  pnpm dev
fi
