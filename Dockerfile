FROM library/debian:stretch
MAINTAINER sergi.albors@zitrogames.com

RUN	apt-get update && \
	apt-get install -y libapache2-mod-php7.0 php7.0 && \
	rm -fr /var/lib/dpkg /var/lib/apt /var/cache/apt /var/www/html/index.html && \
	ln -sf /dev/stdout /var/log/apache2/access.log && \
	ln -sf /dev/sterr /var/log/apache2/error.log

COPY index.html /var/www/html

ENTRYPOINT [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]
