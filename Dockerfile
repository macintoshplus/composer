FROM        	macintoshplus/php:php56
MAINTAINER 	Jean-Baptiste Nahan <jean-baptiste@nahan.fr>

RUN 		echo 'deb http://httpredir.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list
RUN		apt-get update && apt-get -y upgrade

RUN		apt-get install -y openjdk-8-jre-headless ca-certificates-java
RUN 		/var/lib/dpkg/info/ca-certificates-java.postinst configure
RUN 		ln -s /usr/bin/java /bin/java

RUN 		wget -O /usr/local/bin/composer -q http://getcomposer.org/composer.phar
RUN 		chmod +x /usr/local/bin/composer && chmod 777 /root

WORKDIR /src
