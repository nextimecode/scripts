#!/bin/sh

# Import the constants
source /Users/pedroduarte/dev/scripts/constants.sh

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

# Função para verificar a presença de um comando
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Obtém a versão LTS mais recente do Node.js
latest_lts_version=$(curl -s https://nodejs.org/dist/index.json | jq -r '[.[] | select(.lts != false)] | .[0].version')

# Obtém a versão atual do Node.js instalada
current_version=$(node -v)
if [ "$latest_lts_version" != "$current_version" ]; then
  printf "\n${WARNING_EMOJI}${WARNING} Existe uma nova versão LTS do Node.js disponível: $latest_lts_version${RESET}\n"
  printf "${INFO}Sua versão atual é: ${RESET}$current_version\n"
  printf "${INFO}Considere atualizar usando: ${RESET}nvm install --lts\n\n"
fi

# Verificação da presença do pnpm
if ! command_exists pnpm; then
  printf "\n${WARNING_EMOJI}${WARNING} pnpm não está instalado.${RESET}\n"
  printf "${INFO}Para instalar, use: ${RESET}pnpm add -g pnpm\n\n"
  exit 1
fi

# Verificação da versão do pnpm
latest_pnpm_version=$(curl -s https://registry.npmjs.org/pnpm/latest | jq -r '.version')
current_pnpm_version=$(pnpm -v)
if [ "$latest_pnpm_version" != "$current_pnpm_version" ]; then
  printf "\n${WARNING_EMOJI}${WARNING} Existe uma nova versão do pnpm disponível: $latest_pnpm_version${RESET}\n"
  printf "${INFO}Sua versão atual é: ${RESET}$current_pnpm_version\n"
  printf "${INFO}Considere atualizar usando: ${RESET}npm install -g pnpm@latest\n\n"
else
  # Seleciona uma mensagem aleatória
  RANDOM_MESSAGE=${MESSAGES[$RANDOM % ${#MESSAGES[@]}]}

  # Imprime a mensagem
  printf "${BRIGHT_GREEN}%s${RESET}\n\n" "$RANDOM_MESSAGE"
fi

cd /dev || {
  echo "Falha ao mudar para o diretório /dev"
  exit 1
}
