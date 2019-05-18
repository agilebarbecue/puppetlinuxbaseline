#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export SWAN_VER=3.22
cd /tmp

apt-get -yqq --no-install-recommends install \
wget dnsutils openssl ca-certificates kmod \
iproute gawk grep sed net-tools iptables \
bsdmainutils libcurl3-nss \
libnss3-tools libevent-dev libcap-ng0 xl2tpd \
libnss3-dev libnspr4-dev pkg-config libpam0g-dev \
libcap-ng-dev libcap-ng-utils libselinux1-dev \
libcurl4-nss-dev flex bison gcc make \
    && wget -t 3 -T 30 -nv -O "libreswan.tar.gz" "https://github.com/libreswan/libreswan/archive/v${SWAN_VER}.tar.gz" \
    || wget -t 3 -T 30 -nv -O "libreswan.tar.gz" "https://download.libreswan.org/libreswan-${SWAN_VER}.tar.gz" \
    && tar xzf "libreswan.tar.gz" \
    && rm -f "libreswan.tar.gz" \
    && cd "libreswan-${SWAN_VER}" \
    && printf 'WERROR_CFLAGS =\nUSE_DNSSEC = false\nUSE_SYSTEMD_WATCHDOG = false\n' > Makefile.inc.local \
    && make -s base \
    && make -s install-base \
    && rm -rf "/opt/src/libreswan-${SWAN_VER}" \
