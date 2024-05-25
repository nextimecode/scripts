#!/bin/sh

# Importar constantes
source /Users/pedroduarte/dev/scripts/constants.sh

# Lista de projetos
PROJECTS=("nexus" "nexus-client" "atreus" "bord" "skaldic" "skaldic-next" "tracker" "kratos" "var" "gleipnir")

# Exibir o menu de seleção
PS3="Selecione o projeto para o qual deseja fazer o data pull: "
select PROJECT in "${PROJECTS[@]}"; do
    if [[ -n "$PROJECT" ]]; then
        break
    else
        echo "Opção inválida. Por favor, selecione um número válido."
    fi
done

# Executar o comando data:pull apropriado
if [ "$PROJECT" == "skaldic-next" ]; then
    COMMAND="turbo run fenrir:pull:dev --filter $PROJECT"
else
    COMMAND="turbo run data:pull --filter $PROJECT"
fi

printf "${INFO}Executando o comando: $COMMAND${RESET}\n"
eval $COMMAND
