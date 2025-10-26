#!/bin/bash

# Wait until PostgreSQL is ready
until pg_isready -h db -U admin; do
  echo "Waiting for database connection..."
  sleep 2
done

# Load each CSV file into its corresponding table
for file in /raw_data/*.csv; do
  table_name=$(basename "$file" .csv)
  echo "Loading data from $file into table $table_name..."
  psql -h db -U admin -d postgres -c "\COPY $table_name FROM '$file' DELIMITER ',' CSV HEADER;"
done

# Load each json file into its corresponding table
for file in /raw_data/*.json; do
  table_name=$(basename "$file" .json)
  echo "Loading data from $file into table $table_name..."
  psql -h db -U admin -d postgres -c "insert into $table_name select pg_read_file('$file')::jsonb;"
done

echo "Data loading completed."
