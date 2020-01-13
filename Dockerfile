FROM jordancrawford/nginx-auto-reload:latest
MAINTAINER Jordan Crawford <jordan@crawford.kiwi>

# Delete default configuration file.
RUN rm /etc/nginx/conf.d/default.conf

# Setup NGINX config.
COPY includes/* /etc/nginx/
COPY config/* /etc/nginx/conf.d/

VOLUME /letsencrypt-challenge
VOLUME /ssl

# Add self signed certificate.
  # TODO: You'll need to generate a self signed certificate for this - https://www.linode.com/docs/security/ssl/create-a-self-signed-tls-certificate/
RUN mkdir /etc/nginx/ssl
COPY certs /etc/nginx/ssl/

# Expose port 80 and 443.
EXPOSE 80
EXPOSE 443
