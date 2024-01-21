#!/bin/bash
set -e

rm -rf dist
rm -rf node_modules/.cache

rm -rf apps/*/.cache
rm -rf apps/*/node_modules/.cache
rm -rf apps/*/node_modules/.vite
rm -rf apps/*/build
rm -rf apps/*/public/build

# ui
find . -type d -name ".vite-storybook" -not -path "**/node_modules/*" -exec rm -rf "{}" \;

# Typescript
find . -type f -name "tsconfig.tsbuildinfo" -not -path "." -delete

rm -rf apps/*/.turbo
rm -rf apps/*/node_modules
rm -rf apps/*/newrelic_agent.log

rm -rf node_modules
rm -rf pnpm-lock.yaml

pnpm i
pnpm clean:cache
pnpm clean:cache:ts
pnpm bootstrap
pnpm build
