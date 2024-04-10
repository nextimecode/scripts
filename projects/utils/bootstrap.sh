cd /Dev/

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
  "Todos os sistemas operacionais prontos para o dia, Pedro. Qual é o plano?"q
  "Sensores indicam um excelente dia para codificar. Vamos nessa?"
  "Boas-vindas, Pedro. Ajustando ambiente para máxima criatividade."
  "Olá, Pedro! Pronto para desafiar os limites do desenvolvimento Front-End hoje?"
)

# Obtém a versão LTS mais recente do Node.js
latest_lts_version=$(curl -s https://nodejs.org/dist/index.json | jq -r '[.[] | select(.lts != false)] | .[0].version')

# Obtém a versão atual do Node.js instalada
current_version=$(node -v)
if [ "$latest_lts_version" != "$current_version" ]; then
  printf "\n${WARNING_EMOJI}${WARNING}  Existe uma nova versão LTS do Node.js disponível: $latest_lts_version${RESET}\n"
  printf "${INFO}Sua versão atual é: ${RESET}$current_version\n"
  printf "${INFO}Considere atualizar usando: ${RESET}nvm install --lts\n\n"
else
  # Seleciona uma mensagem aleatória
  RANDOM_MESSAGE=${MESSAGES[$RANDOM % ${#MESSAGES[@]}]}

  # Imprime a mensagem
  printf "${BRIGHT_GREEN}%s${RESET}\n\n" "$RANDOM_MESSAGE"
fi



