ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
#ENV ICECAST_VERSION 2.4.2-r1

# Copy root filesystem
COPY rootfs /

# Setup icecast2
RUN apk add --no-cache \
    icecast

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh
RUN chmod 777 -R /usr/local/icecast/logs

CMD ["icecast", "-c", "/etc/icecast.xml"]