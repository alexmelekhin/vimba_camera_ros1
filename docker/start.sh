#!/bin/bash

ARCH=`uname -m`

orange=`tput setaf 3`
reset_color=`tput sgr0`

BASE_PATH=$(cd ./"`dirname $0`" || exit; pwd)
cd $BASE_PATH

echo "Running on ${orange}${ARCH}${reset_color}"

xhost +
docker run -it -d --rm \
    $ARGS \
    --privileged \
    --name vimba_camera_node \
    --net host \
    --ipc host \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    -v $XAUTHORITY:/tmp/.XAuthority -e XAUTHORITY=/tmp/.XAuthority \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    x86_64noetic/vimba_camera
xhost -