#!/bin/bash

source /Users/pedroduarte/dev/scripts/constants.sh

# TITLES=(
#   "1-"
#   "2-"
#   "3-"
#   "4-"
#   "5-"
#   "6-"
#   "7-"
#   "8-"
#   "9-"
#   "10-"
# )

# LINKS=(
#   ""
#   ""
#   ""
#   ""
#   ""
#   ""
#   ""
#   ""
#   ""
#   ""
# )

TITLES=(
  "11-Obtendo resposta do back-end"
  "12-Async Await"
  "13-Entendendo o fluxo do back-end"
  "14-HTTP Client"
  "15-Instalando o Axios"
  "16-Definindo nossa API"
  "17-Utilizando Axios"
  "18-Axios Exceptions"
  "19-Entendendo Interceptors"
  "20-Criando o AppError"
)

LINKS=(
  "https://b-vz-762f4670-e04.tv.pandavideo.com.br/9afa70df-8c2e-416e-8fe5-2099281d95ba/playlist.m3u8"
  "https://b-vz-762f4670-e04.tv.pandavideo.com.br/3ca4854a-bec8-4372-a053-8dfb5ccb55dc/playlist.m3u8"
  "https://b-vz-762f4670-e04.tv.pandavideo.com.br/9b444438-0c80-4847-bc8e-8f6bbe5f4389/playlist.m3u8"
  "https://b-vz-762f4670-e04.tv.pandavideo.com.br/e312cdd8-694a-4ad9-9197-347303f4fe0e/playlist.m3u8"
  "https://b-vz-762f4670-e04.tv.pandavideo.com.br/6b0b2b92-ba5a-42b4-8db1-f02f2bd10092/playlist.m3u8"
  "https://b-vz-762f4670-e04.tv.pandavideo.com.br/ef3f8612-f6cd-4f9e-84cb-564471df6634/playlist.m3u8"
  "https://b-vz-762f4670-e04.tv.pandavideo.com.br/5a4e39f5-4d1a-405e-8ba1-15875defff4b/playlist.m3u8"
  "https://b-vz-762f4670-e04.tv.pandavideo.com.br/0431c5db-deb9-4a66-a403-c860a061d65e/playlist.m3u8"
  "https://b-vz-762f4670-e04.tv.pandavideo.com.br/626f94da-9d3b-4b5c-ada3-b6e1cb4e6230/playlist.m3u8"
  "https://b-vz-762f4670-e04.tv.pandavideo.com.br/75f2999b-8df2-45c0-ac8e-a05e88f68bf5/playlist.m3u8"
)



# Itera sobre os índices para processar os arrays
for i in "${!TITLES[@]}"; do
  TITLE="${TITLES[$i]}"
  LINK="${LINKS[$i]}"

  # Salva o vídeo com o nome correto
  OUTPUT_FILE="./${TITLE}.mp4"

  echo "Baixando: $TITLE"
  ffmpeg -headers "Referer: https://iframe.mediadelivery.net" -i "$LINK" -c copy "$OUTPUT_FILE"

  if [ $? -eq 0 ]; then
    echo "Download concluído para $TITLE."
  else
    echo "Erro ao baixar $TITLE."
  fi
done
