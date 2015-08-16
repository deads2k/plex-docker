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

export HOME=/config
# sleep 5

tail -f ${HOME}/Library/Application\ Support/Plex\ Media\ Server/Logs/**/*.log
LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/lib/plexmediaserver /usr/lib/plexmediaserver/Plex\ Media\ Server

