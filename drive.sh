#!/bin/sh

# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

# Argument passed to the script
drive_type=$1

# Check which drive to open
if [ "$drive_type" = "nextime" ]; then
  echo "${INFO}Opening the NeXTIME drive...${RESET}"
  open -a "Google Chrome" "https://drive.google.com/drive/u/2/my-drive"

elif [ "$drive_type" = "qc" ]; then
  echo "${INFO}Opening the QC drive...${RESET}"
  open -a "Google Chrome" "https://drive.google.com/drive/u/1/my-drive"

else
  echo "${INFO}Opening the drive...${RESET}"
  open -a "Google Chrome" "https://drive.google.com/drive/u/0/my-drive"

fi
