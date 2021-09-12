FROM ubuntu:18.04

# quash warnings
ARG DEBIAN_FRONTEND=noninteractive

# install atlas-server-tools prerequisites
RUN apt-get update && apt-get upgrade -y \
        && apt-get install -y --no-install-recommends \
        perl-modules \
        curl \
        lsof \
        libc6-i386 \
        lib32gcc1 \
        bzip2 \
        jq \
        bash \
        screen \
        vim \
        unzip \
        tzdata \
        wine-stable \
        xvfb \
        ca-certificates \
        wget \
        findutils \
        coreutils \
        perl \
        rsync \
        sed \
        tar


RUN dpkg --add-architecture i386 \
        && apt-get install -y --no-install-recommends \
        dnsutils \
        net-tools \
        libssl1.0.0 \
        libprotobuf-dev \
        libidn11 \
        librtmp1 \
        libgssapi-krb5-2 \
        libcompress-raw-zlib-perl

## configure locale
RUN   update-locale lang=en_US.UTF-8 \
 &&   dpkg-reconfigure --frontend noninteractive locales

COPY  ./entrypoint.sh /entrypoint.sh
CMD   ["/bin/bash", "/entrypoint.sh"]
