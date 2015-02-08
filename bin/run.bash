#!/bin/bash

IP=`ip addr show docker0 | grep inet | grep global | awk '{print $2}' | awk -F/ '{print $1}'`

mkdir -p $HOME/.wine

docker run -t -i --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.wine:/data/.wine -e DISPLAY -e PULSE_SERVER="tcp:$IP:4713" ziyan/wine:$USER

