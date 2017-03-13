#!/bin/sh

if [ ! -f /srv/srcds/serverfiles/srcds_run ]
then
    echo "Executable not found!"
    exit;
fi

if [ ! -f /srv/srcds/addons/.speranza ]
then
    if [ ! -L /srv/srcds/serverfiles/garrysmod/addons ]
    then
        cp -r /srv/srcds/serverfiles/garrysmod/addons/* /srv/srcds/addons
        mv /srv/srcds/serverfiles/garrysmod/addons /srv/srcds/serverfiles/garrysmod/addons_backup
        ln -s /srv/srcds/addons /srv/srcds/serverfiles/garrysmod
    fi

    touch /srv/srcds/addons/.speranza
fi

if [ ! -f /srv/srcds/cfg/.speranza ]
then
    if [ ! -L /srv/srcds/serverfiles/garrysmod/cfg ]
    then
        cp -r /srv/srcds/serverfiles/garrysmod/cfg/* /srv/srcds/cfg
        mv /srv/srcds/serverfiles/garrysmod/cfg /srv/srcds/serverfiles/garrysmod/cfg_backup
        ln -s /srv/srcds/cfg /srv/srcds/serverfiles/garrysmod
    fi

    touch /srv/srcds/cfg/.speranza
fi

/srv/srcds/serverfiles/srcds_run -ip $BIND_IP -port $BIND_PORT -strictportbind "$@"