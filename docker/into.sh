#!/bin/bash

docker exec --user root -it vimba_camera_node \
    /bin/bash -c "cd /; echo vimba_camera_node container; echo ; /bin/bash"