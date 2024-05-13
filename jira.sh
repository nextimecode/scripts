#!/bin/sh

# Import the constants
source /Users/pedroduarte/dev/scripts/constants.sh

echo "${INFO}Opening the JIRA...${RESET}"
open "/Users/pedroduarte/Applications/Jira.app"

sleep 1

# Usa AppleScript para colocar a aplicação em tela cheia
osascript -e 'tell application "System Events" to keystroke "f" using {command down, control down}'
