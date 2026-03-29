#!/bin/sh
set -e

echo "Waiting for postgres..."

# extrai host do DATABASE_URL corretamente
DB_HOST=$(echo $DATABASE_URL | sed -n 's/.*@\([^:]*\):.*/\1/p')

until nc -z $DB_HOST 5432; do
  echo "Postgres unavailable - sleeping"
  sleep 2
done

echo "Postgres is up - running migrations"

npx prisma migrate deploy

echo "Starting app"

node dist/main.js