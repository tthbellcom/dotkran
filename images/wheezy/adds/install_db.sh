#!/bin/bash
echo "running install_db.sh"
touch /var/www/logs/php.log
touch /var/www/logs/error.log
touch /var/www/logs/access.log
chown -R www-data: /var/www
chmod g+rw -R /var/www

echo "==> Installing db"
mysql_install_db > /dev/null

echo ""
echo "==> Starting mysqld"
cd /usr ; /usr/bin/mysqld_safe &
sleep 5

echo ""
echo "==> Create db"
mysql -e "CREATE DATABASE db; GRANT ALL ON db.* TO 'db'@'localhost' IDENTIFIED BY 'db';"

echo ""
echo "Initialized site. Created db:"
echo "  database: db"
echo "  user: db"
echo "  pass: db"
echo ""
echo "...Done!"
