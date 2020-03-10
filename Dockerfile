ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
ENV ICECAST_VERSION 2.4.2-r1

ARG user=icecast
ARG group=icecast


# Copy root filesystem
COPY rootfs /

# Setup icecast
RUN apk add --no-cache \
    icecast

RUN chown -R ${user}:${group} /usr/share/icecast \
   && chown -R ${user}:${group} /var/log/icecast

#USER ${user}
CMD ["icecast", "-c", "/etc/icecast.xml"]