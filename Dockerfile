FROM        	macintoshplus/php56:php7-latest
MAINTAINER 	Jean-Baptiste Nahan <jean-baptiste@nahan.fr>

RUN 		echo 'deb http://httpredir.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list
RUN		apt-get update && apt-get -y upgrade

ENV 		JAVA_VERSION 8u102
ENV 		JAVA_DEBIAN_VERSION 8u102-b14.1-1~bpo8+1
ENV 		CA_CERTIFICATES_JAVA_VERSION 20140324
RUN		apt-get install -y openjdk-8-jre-headless="$JAVA_DEBIAN_VERSION" ca-certificates-java="$CA_CERTIFICATES_JAVA_VERSION"
RUN 		/var/lib/dpkg/info/ca-certificates-java.postinst configure
RUN 		ln -s /usr/bin/java /bin/java

RUN 		wget -O /usr/local/bin/composer -q http://getcomposer.org/composer.phar
RUN 		chmod +x /usr/local/bin/composer && chmod 777 /root

WORKDIR /src
