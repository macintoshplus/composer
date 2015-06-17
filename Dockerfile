FROM        	debian:jessie
MAINTAINER 	Jean-Baptiste Nahan <jean-baptiste@nahan.fr>

ENV 		DEBIAN_FRONTEND noninteractive

RUN 		echo 'deb http://httpredir.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list
RUN		apt-get update && apt-get -y upgrade

# Common packages
RUN 		apt-get -y install curl wget locales nano subversion git unzip

RUN 		echo "Europe/Paris" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
RUN 		export LANGUAGE=en_US.UTF-8 && \
        export LANG=en_US.UTF-8 && \
        export LC_ALL=en_US.UTF-8 && \
        locale-gen en_US.UTF-8 && \
        DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

# PHP
RUN		apt-get -y install mysql-client php5-cli php5-curl php-soap php5-imagick php5-gd php5-mcrypt php5-mysql php5-xmlrpc php5-xsl php5-xdebug php-apc php5-ldap php5-gmp php5-intl php5-redis
RUN 		cp /usr/share/php5/php.ini-development /etc/php5/cli/php.ini
RUN 		sed -i 's/\;date\.timezone\ \=/date\.timezone\ \=\ Europe\/Paris/g' /etc/php5/cli/php.ini
RUN 		sed -i 's/;include_path = ".:\/usr\/share\/php"/include_path = ".:\/var\/www\/library"/g' /etc/php5/cli/php.ini
RUN             sed -i 's/max_execution_time\ \=\ 30/max_execution_time\ \=\ 500/g' /etc/php5/cli/php.ini
RUN             sed -i 's/memory_limit\ \=\ 128M/memory_limit\ \=\ 512M/g' /etc/php5/cli/php.ini

ENV 		JAVA_VERSION 8u45
ENV 		JAVA_DEBIAN_VERSION 8u45-b14-2~bpo8+2
ENV 		CA_CERTIFICATES_JAVA_VERSION 20140324
RUN		apt-get install -y openjdk-8-jre-headless="$JAVA_DEBIAN_VERSION" ca-certificates-java="$CA_CERTIFICATES_JAVA_VERSION"
RUN 		/var/lib/dpkg/info/ca-certificates-java.postinst configure
RUN 		ln -s /usr/bin/java /bin/java

RUN 		wget -O /usr/local/bin/composer -q http://getcomposer.org/composer.phar
RUN 		chmod +x /usr/local/bin/composer

WORKDIR /src
