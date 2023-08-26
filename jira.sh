#!/bin/sh

# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

echo "${BLUE}Opening the JIRA...${RESET}"
open -a "Google Chrome" "https://qconc.atlassian.net/jira/software/projects/DIST/boards/14"
