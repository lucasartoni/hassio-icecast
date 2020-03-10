ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy root filesystem
COPY rootfs /

# Setup icecast2
RUN apk add --no-cache \
    icecast

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]