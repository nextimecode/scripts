#!/bin/sh

# Import the constants
source /Users/pedroduarte/dev/scripts/constants.sh

# Argument passed to the script
drive_type=$1

# Check which drive to open
if [ "$drive_type" = "nextime" ]; then
  echo "${INFO}Opening the NeXTIME calendar...${RESET}"
  open -a "Google Chrome" "https://calendar.google.com/calendar/u/2/r/"

elif [ "$drive_type" = "qc" ]; then
  echo "${INFO}Opening the QC calendar...${RESET}"
  open -a "Google Chrome" "https://calendar.google.com/calendar/u/1/r/"

else
  echo "${INFO}Opening the calendar...${RESET}"
  open -a "Google Chrome" "https://calendar.google.com/calendar/u/0/r/"

fi
