FROM        	macintoshplus/php56:latest
MAINTAINER 	Jean-Baptiste Nahan <jean-baptiste@nahan.fr>

ENV 		JAVA_VERSION 8u45
ENV 		JAVA_DEBIAN_VERSION 8u45-b14-2~bpo8+2
ENV 		CA_CERTIFICATES_JAVA_VERSION 20140324
RUN		apt-get install -y openjdk-8-jre-headless="$JAVA_DEBIAN_VERSION" ca-certificates-java="$CA_CERTIFICATES_JAVA_VERSION"
RUN 		/var/lib/dpkg/info/ca-certificates-java.postinst configure
RUN 		ln -s /usr/bin/java /bin/java

RUN 		wget -O /usr/local/bin/composer -q http://getcomposer.org/composer.phar
RUN 		chmod +x /usr/local/bin/composer

WORKDIR /src
