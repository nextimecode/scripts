#!/bin/sh

# Import the constants
source /Users/pedroduarte/dev/scripts/constants.sh

# Check if a controller name was provided as an argument
if [ -z "$1" ]; then
  echo "\n${ERROR}Controller name is required. Usage: $0 <controller-name>${RESET}"
  exit 1
fi

CONTROLLER_NAME=$1

echo "\n${INFO}Executing nest g co ${CONTROLLER_NAME}, create controller${RESET}"
nest g co controllers/$CONTROLLER_NAME
