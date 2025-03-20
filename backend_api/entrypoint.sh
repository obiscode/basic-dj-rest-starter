#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Checking if the database is up and running..."
    while ! nc -z $SQL_HOST $SQL_PORT; do
        sleep 0.1
    done
    echo "Database is up and running! :-D"
fi

python manage.py migrate

exec "$@"
