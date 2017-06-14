FROM        	macintoshplus/php:php71
MAINTAINER 	Jean-Baptiste Nahan <jean-baptiste@nahan.fr>

RUN 		wget -O /usr/local/bin/composer -q http://getcomposer.org/composer.phar
RUN 		chmod +x /usr/local/bin/composer
RUN 		chmod 777 /root

WORKDIR /sources
