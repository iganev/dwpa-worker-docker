#!/bin/bash

source /root/bin/JohnTheRipper/run/john.bash_completion

export PATH=/root/bin/JohnTheRipper/run:$PATH

SCREEN_NAME="dwpa_worker"

screen -S $SCREEN_NAME -dm bash -c "/root/bin/dwpa/help_crack.py"

while screen -list | grep -q $SCREEN_NAME
do
    sleep 5
done

exit 0
