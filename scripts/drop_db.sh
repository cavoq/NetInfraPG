#!/bin/bash

ENV=${1:-dev.env}

if [ ! -f "$ENV" ]; then
    echo "Environment file $ENV does not exist."
    exit 1
fi

set -a
source $ENV
set +a

export PGPASSWORD=$POSTGRES_PASSWORD

# -- Drop the database

echo "Dropping database ${POSTGRES_DB}..."
docker-compose exec -T alkis_pg psql -U $POSTGRES_USER -d postgres -c "DROP DATABASE IF EXISTS ${POSTGRES_DB};"

unset $PGPASSWORD
