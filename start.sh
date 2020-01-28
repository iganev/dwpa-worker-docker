#!/bin/bash

source /root/bin/JohnTheRipper/run/john.bash_completion

export PATH=/root/bin/JohnTheRipper/run:$PATH

#sleep 3600

SCREEN_NAME="dwpa_worker"

COPTIONS_ARG=""

if [ ! -z "$COPTIONS" ]
then
    COPTIONS_ARG="-co=\"$COPTIONS\""
fi

cron &

screen -AdmS $SCREEN_NAME -L /var/log/$SCREEN_NAME.log bash -c "cd /root/bin/dwpa && /root/bin/dwpa/help_crack.py $COPTIONS_ARG"

while screen -list | grep -q $SCREEN_NAME
do
    sleep 5
done

exit 0
