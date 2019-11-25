service php7.3-fpm start
service nginx start
service mysql start
/usr/share/doc/wordpress/examples/setup-mysql -n wordpress localhost
mysql -u root wordpress < /usr/share/wordpress/phpmyadmin/tmp/wordpress.sql
mysql -u root -e "CREATE USER admin@localhost IDENTIFIED BY 'admin' ; GRANT ALL PRIVILEGES ON wordpress.* TO admin@localhost"

