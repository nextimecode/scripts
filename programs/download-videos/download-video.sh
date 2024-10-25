#!/bin/bash

while true; do
  # Solicita o link do vídeo ao usuário
  read -p "Por favor, forneça o link do vídeo em formato .m3u8 (ou digite 'sair' para encerrar): " VIDEO_LINK

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

  # Define o nome do arquivo de saída
  OUTPUT_FILE="video_$(date +%Y%m%d%H%M%S).mp4"

  # Executa o comando ffmpeg com o link fornecido
  ffmpeg -headers "Referer: https://iframe.mediadelivery.net" -i "$VIDEO_LINK" -c copy "$OUTPUT_FILE"

  echo "Download concluído. O vídeo foi salvo como $OUTPUT_FILE."
  echo
done
