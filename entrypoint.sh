#!/bin/sh
set -e

echo "Running database migrations..."

# tenta rodar migrations até o banco responder
until npx prisma migrate deploy; do
  echo "Database not ready, retrying in 3s..."
  sleep 3
done

echo "Starting application..."

node dist/main.js