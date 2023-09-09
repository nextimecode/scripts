#!/bin/bash

# Lista todos os processos em execução e filtra pelo nome da aplicação
apps=$(osascript -e 'tell application "System Events" to get name of (processes where background only is false)')

# Divide a string em um array separado por vírgulas
IFS=", " read -ra appArray <<< "$apps"

# Loop para fechar cada aplicação
for app in "${appArray[@]}"; do
  osascript -e "tell application \"$app\" to quit"
done

osascript -e 'tell app "System Events" to shut down'
