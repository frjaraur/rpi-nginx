FROM frjaraur/rpi-alpine

RUN addgroup -S nginx \
&& adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx \
&& apk add --update --no-cache nginx \
&& ln -sf /dev/stdout /var/log/nginx/access.log \
&& ln -sf /dev/stderr /var/log/nginx/error.log

COPY simplest_nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

VOLUME /html

CMD ["nginx", "-g", "pid /var/run/nginx.pid;daemon off;"]

