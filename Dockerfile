FROM renshou/steamcmd:latest

# Prevent some warnings
ARG DEBIAN_FRONTEND=noninteractive

# Default port binding
ENV BIND_PORT=27015
ENV BIND_IP=0.0.0.0

# SRCDS parameters
ENV SRCDS_GAME=garrysmod
ENV SRCDS_HOSTNAME="Speranza's Mod"

# Copy scripts
COPY update.txt /srv/srcds/update.txt
COPY start.sh /srv/srcds/start.sh

# Copy cfg
COPY server.cfg /srv/srcds/serverfiles/${SRCDS_GAME}/cfg/server.cfg

# Install dependencies & assign files ownership
RUN apt-get update \
    && apt-get -y install lib32ncurses5 \
    && rm -rf /var/lib/apt/lists/* \
    && chown gameserver:gameserver /srv/srcds/update.txt /srv/srcds/start.sh \
    && chmod +x /srv/srcds/start.sh \
    && ln -s /srv/srcds/serverfiles/${SRCDS_GAME}/addons /srv/srcds/addons \
    && ln -s /srv/srcds/serverfiles/${SRCDS_GAME}/cfg/server.cfg /srv/srcds/server.cfg


# Switch to non root user
USER gameserver

CMD ["+map gm_construct", "-tickrate 16"]