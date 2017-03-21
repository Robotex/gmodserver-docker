#!/bin/sh

if [ ! -f /srv/srcds/serverfiles/srcds_run ]
then
    echo "Executable not found!"
    exit;
fi

/usr/games/gameserver/serverfiles/srcds_run -game $SRCDS_GAME -ip $BIND_IP -port $BIND_PORT -strictportbind "$@" -norestart -steam_dir ~/.steam/steamcmd -steamcmd_script /usr/games/gameserver/update.txt +hostname \"${SRCDS_HOSTNAME}\" &

childpid=$! 
while wait $childpid; test $? -gt 128; do
    kill -0 $childpid 2> /dev/null || break;
done