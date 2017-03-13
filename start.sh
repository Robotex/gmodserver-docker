#!/bin/sh

if [ ! -f /srv/srcds/serverfiles/srcds_run ]
then
    echo "Executable not found!"
    exit;
fi

/srv/srcds/serverfiles/srcds_run -autoupdate -steam_dir /usr/games/ -steamcmd_script /srv/srcds/update.txt -game ${SRCDS_GAME} -ip ${BIND_IP} -port ${BIND_PORT} -strictportbind -tvdisable +hostname \"${SRCDS_HOSTNAME}\" "$@"