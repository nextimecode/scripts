#!/bin/bash

source /Users/pedroduarte/dev/scripts/constants.sh

while true; do
  # Solicita o link do vídeo ao usuário
  echo "${BRIGHT_GREEN}Por favor, forneça o link do vídeo em formato .m3u8 (ou digite 'sair' para encerrar): ${RESET}"
  read -p "" VIDEO_LINK

  # Verifica se o usuário deseja sair
  if [ "$VIDEO_LINK" == "sair" ]; then
    echo "Encerrando o programa."
    exit 0
  fi

  # Verifica se o link está vazio
  if [ -z "$VIDEO_LINK" ]; then
    echo "O link não pode estar vazio. Tente novamente."
    continue
  fi

  # Solicita o nome do arquivo de saída ao usuário
  echo "${INFO}Por favor, forneça o nome do arquivo de saída (ou pressione Enter para usar o padrão): ${RESET}"
  read -p "" OUTPUT_FILE

  # Define o nome do arquivo de saída padrão caso o usuário não forneça um
  if [ -z "$OUTPUT_FILE" ]; then
    OUTPUT_FILE="video_$(date +%Y%m%d%H%M%S).mp4"
  else
    # Garante que o nome tenha a extensão .mp4
    if [[ "$OUTPUT_FILE" != *.mp4 ]]; then
      OUTPUT_FILE="${OUTPUT_FILE}.mp4"
    fi
  fi

  # Executa o comando ffmpeg com o link fornecido
  ffmpeg -headers "Referer: https://iframe.mediadelivery.net" -i "$VIDEO_LINK" -c copy "$OUTPUT_FILE"

  echo "${SUCCESS}Download concluído. O vídeo foi salvo como $OUTPUT_FILE.${RESET}"
  echo
done
