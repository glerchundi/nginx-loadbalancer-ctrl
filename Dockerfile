FROM quay.io/justcontainers/base-alpine:v0.12.2
MAINTAINER Gorka Lerchundi Osa <glertxundi@gmail.com>

##
## INSTALL
##

# nginx
RUN apk-install openssl ca-certificates nginx=1.10.1-r1

# kube2nginx
ADD https://github.com/glerchundi/kube2nginx/releases/download/v0.4.2/kube2nginx-linux-amd64 /usr/bin/kube2nginx
RUN chmod 0755 /usr/bin/kube2nginx

##
## ROOTFS
##

# root filesystem
COPY rootfs /

# s6-fdholderd active by default
RUN s6-rmrf /etc/s6/services/s6-fdholderd/down
