ARG BUILD_FROM=hassioaddons/base:7.0.3
FROM $BUILD_FROM

ENV LANG C.UTF-8
ENV ICECAST_VERSION 2.4.2-r1

ARG user=nobody
ARG group=nogroup

# Setup icecast
RUN apk add --no-cache \
    icecast


# Copy root filesystem
COPY rootfs /

RUN chmod 777 /var/log/icecast/access.log \
	&& chmod 777 /var/log/icecast/error.log 




# USER ${user}
CMD ["icecast", "-c", "/etc/icecast.xml"]