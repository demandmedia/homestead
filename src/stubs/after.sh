#!/usr/bin/env bash
config_files=($(find /etc/nginx/sites-available -type f))
for i in “${config_files[@]}”
do
    sed -i '/ fastcgi_intercept_errors /s/^/#/' $i
done
service nginx restart
service php5-fpm restart