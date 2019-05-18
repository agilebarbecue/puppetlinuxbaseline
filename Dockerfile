FROM ubuntu:18.04
RUN mkdir -p /opt/puppetlinuxbaseline
COPY . /opt/puppetlinuxbaseline/
RUN apt-get -yq update && apt-get -yq dist-upgrade && apt-get -yq install puppet
RUN useradd paul && mkdir -p /home/paul && chown paul /home/paul
RUN (cd /opt/puppetlinuxbaseline && ./run.sh)
RUN apt-get -yq install ubuntu-desktop firefox
