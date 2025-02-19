#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    # Check if the database is up and running
    echo "Checking if the database is up and running..."
    while ! nc -z $SQL_HOST $SQL_PORT; do
    sleep 0.1
    done

    echo "Database is up and running! :-D"

fi

#python manage.py makemigrations
python manage.py migrate

exec "$@"




