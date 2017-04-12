#!/bin/sh

if [ ! -f /usr/games/gameserver/serverfiles/srcds_run ]
then
    echo "Executable not found!"
    exit;
fi

/usr/games/gameserver/serverfiles/srcds_run -game "${SRCDS_GAME}" -strictportbind -ip "${BIND_IP}" -port "${BIND_PORT}" +clientport "${SRCDS_CLIENT_PORT}" +tv_port "${SRCDS_TV_PORT}" +host_workshop_collection "${WORKSHOP_COLLECTION}" -authkey "${AUTHKEY}" -pingboost 2 -timeout 0 +exec server/autoexec.cfg -autoupdate -steam_dir ~/.steam/steamcmd -steamcmd_script /usr/games/gameserver/update.txt +hostname \""${SRCDS_HOSTNAME}"\" "$@"