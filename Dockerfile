FROM        	macintoshplus/php:php70
MAINTAINER 	Jean-Baptiste Nahan <jean-baptiste@nahan.fr>

RUN 		wget -O /usr/local/bin/composer -q http://getcomposer.org/composer.phar
RUN 		chmod +x /usr/local/bin/composer && chmod 777 /root

WORKDIR /sources
