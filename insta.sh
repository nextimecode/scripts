#!/bin/sh

# Import the constants
source /Users/pedroduarte/dev/scripts/constants.sh

echo "${INFO}Opening the Instagram...${RESET}"
open -a "Google Chrome" "https://www.instagram.com/"

sleep 1

# Usa AppleScript para colocar a aplicação em tela cheia
osascript -e 'tell application "System Events" to keystroke "f" using {command down, control down}'

