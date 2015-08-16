#! /bin/bash

# rm -rf /var/run/*
# rm -f "/config/Library/Application Support/Plex Media Server/plexmediaserver.pid"

mkdir -p /var/run/dbus
adduser messagebus
chown messagebus:messagebus /var/run/dbus
dbus-uuidgen --ensure
dbus-daemon --system --fork
sleep 1

# avahi-daemon -D
# sleep 1

PLEX_HOME=/home/plex

mkdir -p ${PLEX_HOME}
chown plex:plex ${PLEX_HOME}
export HOME=${PLEX_HOME}
# sleep 5

source /etc/sysconfig/PlexMediaServer
/usr/lib/plexmediaserver/Plex\ Media\ Server &


tail -f ${PLEX_HOME}/Library/Logs/Plex\ Media\ Server.log
