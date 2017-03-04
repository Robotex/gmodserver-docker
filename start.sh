#!/bin/sh

if [ ! -f /srv/$GAME/serverfiles/srcds_run ]
then
    echo "Executable not found!"
    exit;
fi

if [ ! -f /srv/${GAME}/addons/.speranza ]
then
    if [ ! -L /srv/${GAME}/serverfiles/garrysmod/addons ]
    then
        cp -r /srv/${GAME}/serverfiles/garrysmod/addons/* /srv/${GAME}/addons
        mv /srv/${GAME}/serverfiles/garrysmod/addons /srv/${GAME}/serverfiles/garrysmod/addons_backup
        ln -s /srv/${GAME}/addons /srv/${GAME}/serverfiles/garrysmod
    fi

    touch /srv/${GAME}/addons/.speranza
fi

if [ ! -f /srv/${GAME}/cfg/.speranza ]
then
    if [ ! -L /srv/${GAME}/serverfiles/garrysmod/cfg ]
    then
        cp -r /srv/${GAME}/serverfiles/garrysmod/cfg/* /srv/${GAME}/cfg
        mv /srv/${GAME}/serverfiles/garrysmod/cfg /srv/${GAME}/serverfiles/garrysmod/cfg_backup
        ln -s /srv/${GAME}/cfg /srv/${GAME}/serverfiles/garrysmod
    fi

    touch /srv/${GAME}/cfg/.speranza
fi

/srv/$GAME/serverfiles/srcds_run -ip $BIND_IP -port $BIND_PORT -strictportbind "$@"