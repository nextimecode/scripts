#!/bin/bash

source /Users/pedroduarte/dev/scripts/constants.sh

source /Users/pedroduarte/dev/scripts/programs/download-videos/items.sh

for i in "${!TITLES[@]}"; do
  TITLE="${TITLES[$i]}"
  LINK="${LINKS[$i]}"

  # Ignorar se o link estiver vazio
  if [[ -z "$LINK" ]]; then
    printf "\n${WARNING}${WARNING_EMOJI} Ignorando: $TITLE (link vazio).\n"
    continue
  fi

  # Salva o vídeo com o nome correto
  OUTPUT_FILE="./videos/${TITLE}.mp4"

  printf "\n${INFO}${INFO_EMOJI}  Baixando: $TITLE\n"

  # Obtém a duração total do vídeo em segundos
  duration=$(ffmpeg -headers "Referer: https://iframe.mediadelivery.net" -i "$LINK" 2>&1 | grep "Duration" | awk '{print $2}' | tr -d ,)
  duration_seconds=$(printf "%s" "$duration" | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }')

  if [[ -z "$duration_seconds" || "$duration_seconds" -eq 0 ]]; then
    printf "\n${ERROR}${ERROR_EMOJI} Erro ao obter duração do vídeo para $TITLE. Pulando.\n"
    continue
  fi

  # Usa ffmpeg com exibição de progresso
  ffmpeg -headers "Referer: https://iframe.mediadelivery.net" -i "$LINK" -c copy "$OUTPUT_FILE" -progress pipe:1 2>&1 | \
  while IFS= read -r line; do
    if [[ "$line" =~ out_time_ms ]]; then
      current_time_ms=$(echo "$line" | awk -F= '{ print $2 }')

      if [[ -n "$current_time_ms" && "$current_time_ms" -gt 0 ]]; then
        current_time_seconds=$((current_time_ms / 1000000)) # Converte milissegundos para segundos

        if [[ "$duration_seconds" -gt 0 ]]; then
          progress=$((current_time_seconds * 100 / duration_seconds))
          printf "\rProgresso: %s%%" "$progress"
        fi
      fi
    fi
  done

  # Verifica o status do comando ffmpeg
  if [[ $? -eq 0 ]]; then
    printf "\n\n${SUCCESS}${SUCCESS_EMOJI} Download concluído para $TITLE.\n"
  else
    printf "\n\n${ERROR}${ERROR_EMOJI} Erro ao baixar $TITLE.${RESET}\n"
  fi
done
