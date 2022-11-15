#!/bin/bash

docker exec --user root -it vimba_camera_node \
    /bin/bash -c "cd /; ./ros_entrypoint.sh roslaunch avt_vimba_camera mono_camera.launch guid:=DEV_000F31039689"