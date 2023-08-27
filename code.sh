#!/bin/sh

# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

# Verifica se um argumento foi passado
if [ "$#" -ne 1 ]; then
    echo "${RED}Uso correto: $0 nome_do_projeto${RESET}"
    exit 1
fi

PROJETO=$1

# Verifica se o diretório do projeto existe
if [ ! -d "/Users/pedroduarte/Dev/$PROJETO" ]; then
    echo "${RED}O projeto $PROJETO não existe.${RESET}"
    exit 1
fi

echo "${BRIGHT_CYAN}Abrindo o projeto $PROJETO no Visual Studio Code...${RESET}"
command code "/Users/pedroduarte/Dev/$PROJETO"
