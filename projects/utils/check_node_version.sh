#!/bin/bash

# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

# Obtém a versão LTS mais recente do Node.js
latest_lts_version=$(curl -s https://nodejs.org/dist/index.json | jq -r '[.[] | select(.lts != false)] | .[0].version')

# Obtém a versão atual do Node.js instalada
current_version=$(node -v)
if [ "$latest_lts_version" != "$current_version" ]; then
  printf "\n${INFO}Existe uma nova versão LTS do Node.js disponível:${RESET} $latest_lts_version${RESET}\n"
  printf "${INFO}Sua versão atual é: ${RESET}$current_version\n"
  printf "${INFO}Considere atualizar usando: ${RESET}nvm install --lts\n\n"
fi
