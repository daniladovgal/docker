#!/bin/sh
sh docker/wait-for.sh db:${DB_PORT}
composer install
php artisan migrate
php artisan optimize:clear
php artisan storage:link
exec $@
