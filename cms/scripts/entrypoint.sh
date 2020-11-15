#!/bin/bash

# Wait for the database
wait_for_db() {
  counter=0
  echo "Connecting to posrgress"
  while ! nc -z db 5432; do
    counter=$((counter+1))
    if [ $counter == 30 ]; then
      echo "Error: Couldn't connect to Postgres."
      exit 1
    fi
    echo "Trying to connect to Postgres at $postgres_address. Attempt $counter."
    sleep 5
  done
}

# Clean environment
if [ -f ./tmp/pids/server.pid ]; then
  echo -e "\nCleaning environment"
  rm tmp/pids/server.pid
fi

# Install dependencies
echo -e "\nChecking gems"
bundle install --quiet

bin/rake db:setup
bin/rake db:migrate
bin/rake db:seed

# Run!
echo -e "\nRunning server"
exec "$@"
