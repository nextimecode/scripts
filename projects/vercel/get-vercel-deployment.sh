#!/bin/bash

export $(grep -v '^#' /Users/pedroduarte/dev/scripts/.env | xargs)

export TEAM_ID="team_CbbcZzr5hBahVwYDcJf0f3tN"
export PROJECT_ID="prj_2ON1pBH3BXFDAOGpyuorGAV9b5mQ"

# Se não estiver rodando em um ambiente GitHub Actions, pegue a branch local
if [ -z "$GITHUB_REF" ]; then
    BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
else
    BRANCH_NAME=${GITHUB_REF#refs/heads/}
fi

echo "Looking for deployment for branch: $BRANCH_NAME"

# Buscar o deployment correto para a branch
DEPLOYMENT_URL=$(curl -s -H "Authorization: Bearer $VERCEL_TOKEN" \
  "https://api.vercel.com/v6/deployments?teamId=$TEAM_ID&projectId=$PROJECT_ID" \
  | jq -r --arg branch "$BRANCH_NAME" '.deployments[] | select(.meta.githubCommitRef == $branch) | .meta.branchAlias' | head -n 1)

if [ -z "$DEPLOYMENT_URL" ] || [ "$DEPLOYMENT_URL" == "null" ]; then
  echo "No deployment found for branch $BRANCH_NAME"
  exit 1
fi

# Exibir e exportar a URL do deployment
DEPLOYMENT_URL="https://$DEPLOYMENT_URL"
export DEPLOYMENT_URL

echo "Deployment URL found: $DEPLOYMENT_URL"
