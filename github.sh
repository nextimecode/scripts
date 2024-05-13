#!/bin/sh

# Import the constants
source /Users/pedroduarte/dev/scripts/constants.sh

# Argument passed to the script
drive_type=$1

# Check which drive to open
if [ "$drive_type" = "nextime" ]; then
  echo "${INFO}Opening the NeXTIME github...${RESET}"
  open -a "Chromium" "https://github.com/"

else
  echo "${INFO}Opening the calendar...${RESET}"
  open -a "Google Chrome" "https://github.com/"

fi
