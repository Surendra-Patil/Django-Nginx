FROM nginx:1.16.1
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y openssl sudo
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d
COPY ssl.sh /
RUN /bin/bash /ssl.sh
RUN openssl dhparam -out /etc/ssl/surendra.com.dhparam.pem 2048
