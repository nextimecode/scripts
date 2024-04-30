set -e

source /Users/pedroduarte/Dev/scripts/constants.sh

echo "\n${ERROR}Removendo diretórios de distribuição antigos e caches...${RESET}"
rm -rf dist
rm -rf node_modules/.cache

echo "\n${ERROR}Removendo caches nos projetos...${RESET}"
rm -rf apps/*/.cache
rm -rf apps/*/node_modules/.cache
rm -rf apps/*/node_modules/.vite
rm -rf apps/*/build
rm -rf apps/*/public/build

echo "\n${ERROR}Removendo caches de Storybook não relacionados a módulos...${RESET}"
find . -type d -name ".vite-storybook" -not -path "**/node_modules/*" -exec rm -rf "{}" \;

echo "\n${ERROR}Removendo informações de build do TypeScript...${RESET}"
find . -type f -name "tsconfig.tsbuildinfo" -not -path "." -delete

echo "\n${ERROR}Removendo arquivos de turbo e logs antigos...${RESET}"
rm -rf apps/*/.turbo
rm -rf apps/*/node_modules
rm -rf apps/*/newrelic_agent.log


echo "\n${ERROR}Removendo cache geral...${RESET}"
pnpm clean:cache

echo "\n${ERROR}Removendo cache de TypeScript...${RESET}"
pnpm clean:cache:ts

echo "\n${ERROR}Removendo diretório node_modules e lockfiles...${RESET}"
rm -rf node_modules
rm -rf pnpm-lock.yaml

echo "\n${ERROR}Removendo cache do pnpm...${RESET}"
pnpm store prune

echo "\n${INFO}Instalando dependências...${RESET}"
pnpm i

echo "\n${INFO}Preparando projetos...${RESET}"
pnpm bootstrap

echo "\n${INFO}Construindo projetos...${RESET}"
pnpm build

echo "\n${SUCCESS}Script concluído!${RESET}"
