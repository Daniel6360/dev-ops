#!/bin/bash
set -e

# Connect to the default "postgres" database to create the new database
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "postgres" <<-EOSQL
    CREATE DATABASE onlybills;
EOSQL

# Connect to the newly created database to create the schema
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "onlybills" <<-EOSQL
    CREATE SCHEMA "onlybills-be";
EOSQL
