#!/bin/sh

# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

# Check if an argument was provided
if [ "$#" -ne 1 ]; then
    printf "${ERROR}❌ Correct usage: $0 project_name${RESET}\n"
    exit 1
fi

# Project name
PROJETO=$1

# List of qcx projects
QCX_PROJECTS=("artemis" "kori" "kratos" "olimpo" "sleipnir" "odin")

# Determine if the project is a qcx project
IS_QCX_PROJECT=false
for QCX_PROJ in "${QCX_PROJECTS[@]}"; do
    if [ "$PROJETO" == "$QCX_PROJ" ]; then
        IS_QCX_PROJECT=true
        break
    fi
done

# Open the Pull Requests page based on the domain
if [ "$IS_QCX_PROJECT" = true ]; then
    printf "${INFO}Opening the Pull Requests for project ${BRIGHT_PURPLE}%s${INFO} on GitHub under domain qcx...${RESET}\n" "$PROJETO"
    open -a "Google Chrome" "https://github.com/qcx/$PROJETO/pulls"
else
    printf "${INFO}Opening the Pull Requests for project ${BRIGHT_PURPLE}%s${INFO} on GitHub under domain nextimecode...${RESET}\n" "$PROJETO"
    open -a "Google Chrome" "https://github.com/nextimecode/$PROJETO/pulls"
fi
