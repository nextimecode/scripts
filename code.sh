#!/bin/sh

# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

# Verifica se um argumento foi passado
if [ "$#" -ne 1 ]; then
    printf "${ERROR}❌ Correct usage: $0 project_name${RESET}"
    exit 1
fi

PROJETO=$1
BASE_DIR="/Users/pedroduarte/Dev"
QC_DIR="$BASE_DIR/qc"
 ="$BASE_DIR/qc-old"
CLIENTS="$BASE_DIR/clientes"
TEMPLATES="$BASE_DIR/templates"
EDUCATION="$BASE_DIR/education" 

# Verifica se o diretório do projeto existe em uma das pastas
if [ -d "$BASE_DIR/$PROJETO" ]; then
    PROJETO_DIR="$BASE_DIR/$PROJETO"
elif [ -d "$QC_DIR/$PROJETO" ]; then
    PROJETO_DIR="$QC_DIR/$PROJETO"
elif [ -d "$EDUCATION/$PROJETO" ]; then
    PROJETO_DIR="$EDUCATION/$PROJETO"
elif [ -d "$QC_OLD_DIR/$PROJETO" ]; then
    PROJETO_DIR="$QC_OLD_DIR/$PROJETO"
elif [ -d "$CLIENTS/$PROJETO" ]; then
    PROJETO_DIR="$CLIENTS/$PROJETO"
elif [ -d "$TEMPLATES/$PROJETO" ]; then
    PROJETO_DIR="$TEMPLATES/$PROJETO"
else
    printf "${ERROR}❌ The project ${BRIGHT_PURPLE}%s${INFO} does not exist.${RESET}\n" "$PROJETO"
    exit 1
fi

printf "${INFO}Opening project ${BRIGHT_PURPLE}%s${INFO} in Visual Studio Code...${RESET}\n" "$PROJETO"
command code "$PROJETO_DIR"
