#!/bin/bash
export $(grep -v '^#' /Users/pedroduarte/dev/scripts/.env | xargs)

TEAM_ID=$(curl -s -H "Authorization: Bearer $VERCEL_TOKEN" "https://api.vercel.com/v1/teams" | jq -r '.teams[0].id')

PROJECT_DATA=$(curl -s -H "Authorization: Bearer $VERCEL_TOKEN" "https://api.vercel.com/v9/projects" | jq -r '.projects[] | "\(.name) \(.id)"')

echo "Team ID: $TEAM_ID"
echo "Projects:"
echo "$PROJECT_DATA"

# Exportando a primeira ocorrência do projectId para facilitar o uso
FIRST_PROJECT_ID=$(echo "$PROJECT_DATA" | awk '{print $2}' | head -n 1)

export TEAM_ID
export PROJECT_ID=$FIRST_PROJECT_ID

echo "Exported TEAM_ID=$TEAM_ID"
echo "Exported PROJECT_ID=$PROJECT_ID"
