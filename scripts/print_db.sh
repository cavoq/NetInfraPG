#!/bin/bash

export PGPASSWORD=$POSTGRES_PASSWORD

SCHEMA="network_infrastructure"
QUERY="SELECT table_name FROM information_schema.tables WHERE table_schema = '$SCHEMA';"


echo "Printing schemas of database "$POSTGRES_DB"..."
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "\dn"

echo "Printing tables of schema "$SCHEMA"..."
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "$QUERY"

echo "Printing columns of tables of schema "$SCHEMA"..."
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "\d $SCHEMA.*"

unset PGPASSWORD
