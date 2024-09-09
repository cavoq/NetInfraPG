#!/bin/bash

export PGPASSWORD=$POSTGRES_PASSWORD

# -- Drop the database

echo "Dropping database ${POSTGRES_DB}..."
psql -U "$POSTGRES_USER" -d postgres -c "DROP DATABASE IF EXISTS \"$POSTGRES_DB\";"

unset PGPASSWORD
