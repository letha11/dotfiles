#!/bin/bash

# start nginx
sudo systemctl restart nginx.service 
# start mariadb
sudo systemctl restart mariadb.service
#start php-fpm
sudo systemctl restart php-fpm.service
