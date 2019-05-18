FROM devbox-mezz:latest
ARG devusername=paul

RUN useradd -u 1000 ${devusername}
COPY files/resources/viminstall.sh /tmp
RUN /tmp/viminstall.sh ${devusername}
