FROM debian:buster

RUN apt-get update 
RUN apt-get install -y vim nginx default-mysql-server php-fpm php-mbstring php-mysql wordpress
RUN rm /etc/nginx/sites-enabled/default
COPY srcs/nginx-wordpress.conf /etc/nginx/conf.d/
RUN chmod +x /usr/share/doc/wordpress/examples/setup-mysql


COPY srcs/.bashrc /root/
COPY srcs/phpMyAdmin-4.9.2-all-languages.tar.gz /usr/share/wordpress
RUN cd /usr/share/wordpress && tar xf phpMyAdmin-4.9.2-all-languages.tar.gz && rm phpMyAdmin-4.9.2-all-languages.tar.gz && mv phpMyAdmin-4.9.2-all-languages phpmyadmin
COPY srcs/config.inc.php /usr/share/wordpress/phpmyadmin
RUN mkdir /usr/share/wordpress/phpmyadmin/tmp && chmod 777 /usr/share/wordpress/phpmyadmin/tmp
COPY srcs/domain.crt /etc/ssl/certs
COPY srcs/domain.key /etc/ssl/private
COPY srcs/wordpress.sql /usr/share/wordpress/phpmyadmin/tmp/
