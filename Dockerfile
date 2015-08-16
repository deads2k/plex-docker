FROM fedora:21
MAINTAINER David <david@private.pro>
#Thanks to https://github.com/bydavy/docker-plex/blob/master/Dockerfile and https://github.com/aostanin/docker-plex/blob/master/Dockerfile

RUN yum install -y -q wget policycoreutils avahi

#RUN wget https://downloads.plex.tv/plex-media-server/0.9.9.14.531-7eef8c6/plexmediaserver-0.9.9.14.531-7eef8c6.x86_64.rpm
ADD ./plexmediaserver-0.9.9.14.531-7eef8c6.x86_64.rpm /plexmediaserver-0.9.9.14.531-7eef8c6.x86_64.rpm

RUN su - -c "rpm -ivh /plexmediaserver-0.9.9.14.531-7eef8c6.x86_64.rpm"

VOLUME /config
VOLUME /data

EXPOSE 32400

ADD ./PlexMediaServer /etc/sysconfig/PlexMediaServer
ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

CMD /start.sh

#CMD ["systemctl start plexmediaserver"]

