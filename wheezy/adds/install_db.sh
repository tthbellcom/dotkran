#!/bin/bash
mysql_install_db

mysqld_safe &
sleep 5
touch /var/www/logs/php.log
touch /var/www/logs/error.log
touch /var/www/logs/access.log
chown -R www-data: /var/www
chmod g+rw -R /var/www

echo "Create db"
mysql -e "CREATE DATABASE drupal; GRANT ALL ON drupal.* TO 'drupal'@'localhost' IDENTIFIED BY 'drupal';"

echo "Set root password"
mysqladmin -u root password 'database'
