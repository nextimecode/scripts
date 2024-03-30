#!/bin/sh

# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

# Mensagens de Eru Ilúvatar
MESSAGES=(
  "Bom dia, Pedro! O que vamos criar hoje?"
  "Iniciando sistemas... Pronto para a inovação, Sr. Pedro!"
  "Análises completas, café na temperatura ideal. Vamos começar?"
  "Protocolos de produtividade ativados. Prepare-se para um dia eficiente!"
  "Verificações de segurança concluídas. Sua estação de desenvolvimento está pronta."
  "Olá, Pedro! Sua agenda de hoje está carregada de possibilidades."
  "Todos os sistemas operacionais prontos para o dia, Pedro. Qual é o plano?"
  "Sensores indicam um excelente dia para codificar. Vamos nessa?"
  "Boas-vindas, Pedro. Ajustando ambiente para máxima criatividade."
  "Olá, Pedro! Pronto para desafiar os limites do desenvolvimento Front-End hoje?"
)

# Seleciona uma mensagem aleatória
RANDOM_MESSAGE=${MESSAGES[$RANDOM % ${#MESSAGES[@]}]}

# Imprime a mensagem
printf "${BRIGHT_GREEN}%s${RESET}\n\n" "$RANDOM_MESSAGE"
