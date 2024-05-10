#!/bin/sh

set -e

python manage.py makemigrations
pyython manage.py migrate

python manage.py collectstatic --noinput
