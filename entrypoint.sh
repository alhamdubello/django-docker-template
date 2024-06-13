#!/bin/bash
set -e
which python
python -V

echo "Apply database migrations"
python manage.py migrate

# Execute the command provided as CMD in the Dockerfile or the command in the docker-compose.yml
exec "$@"