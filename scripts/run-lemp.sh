#!/bin/bash

# start nginx
sudo systemctl restart nginx.service # phpprojects.local/ -> ~/code/php/
# start mariadb
sudo systemctl restart mariadb.service
#start php-fpm
sudo systemctl restart php-fpm.service
# start httpd/apache
sudo systemctl restart httpd.service # localhost:8085/ -> ~/code/php/
