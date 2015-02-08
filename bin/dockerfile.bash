#!/bin/bash

WINE_USER_ID=`id -u`
WINE_USER=`id -u -n`
WINE_GROUP_ID=`id -g`
WINE_GROUP=`id -g -n`

cat << EOF
FROM ziyan/wine:latest

RUN \\
    groupadd -f -g $WINE_GROUP_ID $WINE_GROUP && \\
    ( useradd -u $WINE_USER_ID -g $WINE_GROUP_ID -s /bin/bash -d /data $WINE_USER || true ) && \\
    gpasswd -a $WINE_USER sudo && \\
    echo "$WINE_USER ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/$WINE_USER && \\
    mkdir -p /data && \\
    chown -R $WINE_USER_ID:$WINE_GROUP_ID /data

WORKDIR /data
ENV HOME /data
USER $WINE_USER

ADD entrypoint.bash /entrypoint.bash
ENTRYPOINT /entrypoint.bash

EOF
