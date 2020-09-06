FROM 	alpine:latest
LABEL 	maintainer "Alexander Sperling <alexander@sprlng.de>"
RUN 	apk update \
	&& apk add --no-cache nginx \
	&& mkdir /var/www/sprlng.de \
	&& chown -R nginx:nginx /var/www/sprlng.de \
	&& chmod -R 755 /var/www/sprlng.de \
	&& mkdir /run/nginx \
	&& rm -rf /etc/nginx/conf.d/default.conf
ADD	config/homepage.conf /etc/nginx/conf.d/homepage.conf
ADD	config/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN	chmod +x /usr/local/bin/entrypoint.sh
EXPOSE	8080
ENTRYPOINT	["entrypoint.sh"]
