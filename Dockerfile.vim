FROM devbox-mezz:latest
ARG devusername=paul
ARG homedir=/home

RUN useradd -u 1000 ${devusername}
COPY files/resources/viminstall.sh /tmp
RUN /tmp/viminstall.sh ${devusername} ${homedir}
