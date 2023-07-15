# Home Server NGINX Proxy Example
This repo contains an example NGINX config and Dockerfile similar to the one which I used in my [home server without portforwarding](https://jc.kiwi/home-server-without-portforward/) article.

This is intended to be used on a public server which can proxy web requests to your home server via a VPN link, as I discuss in my article.

**Please note that this is a few years old now so may be slightly out of date - pull requests and issue suggestions are welcome, but please remember the context for which this was intended, as illustrated by my article.**

## Running

* Ensure ports 80 and 443 are mapped to your Docker host (i.e.: available on the internet)
* Map `/letsencrypt-challenge` to your Lets Encrypt `webroot` directory.
* Map `/ssl` to your Lets Encrypt `data` directory.

## SSL

* I use the [LetsEncrypt Manager](https://github.com/gitsf/docker-letsencrypt-manager) Docker image to automatically renew my SSL certs. Both containers will need to share the ... and ... directories. The `.well-known` path is made available via NGINX to allow successful domain renewal.
* To setup DHParams for your domains, use `openssl dhparam -out dhparam.pem 4096` as specified in https://raymii.org/s/tutorials/Strong_SSL_Security_On_nginx.html
