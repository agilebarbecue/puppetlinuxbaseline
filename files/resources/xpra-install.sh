#!/bin/bash

. /etc/lsb-release

curl https://xpra.org/gpg.asc | apt-key add -
echo "deb https://xpra.org/ ${DISTRIB_CODENAME} main" > /etc/apt/sources.list.d/xpra.list
apt-get -y update
apt-get -y install xpra
