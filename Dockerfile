FROM openjdk:jre-alpine
MAINTAINER Ross Allan <docker@nallar.me>

ENV LANG=C.UTF-8 \
FIX_PERMISSIONS=true \
LOGPATH=/log \
LOGFILE=access.log* \
REPORTPATH=/report \
REPORTFILE=index.html \
CONFIGPATH=/config \
WSHOST=auto

COPY root/ /
RUN chmod +x /root/*.sh && /bin/sh /root/install.sh

VOLUME /report /log /config

ENTRYPOINT ["/sbin/tini", "--", "/root/init.sh"]
CMD ["/root/init.sh"]