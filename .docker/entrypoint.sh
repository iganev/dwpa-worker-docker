#!/bin/bash

RUNTIME_DEST=/srv/app/runtime

# Download dwpa hc runtime
wget -nc -P $RUNTIME_DEST "${PUBLIC_URL}/hc/help_crack.py"
wget -nc -P $RUNTIME_DEST "${PUBLIC_URL}/hc/help_crack.py.version"
wget -nc -P $RUNTIME_DEST "${PUBLIC_URL}/hc/CHANGELOG"

chmod +x "${RUNTIME_DEST}/help_crack.py"

for RULE in $RULES
do
  COPTIONS+=" -r ../rules/${RULE}"
done

if [ ! -z "$EXTRA_DICT" ]
then
  AD="-ad=\"../dicts/${EXTRA_DICT}\""
else
  AD=""
fi

# screen -S help_crack -L -Logfile help_crack.log ./help_crack.py -co="$COPTIONS" -pot=results.pot $AD

cd $RUNTIME_DEST && ./help_crack.py -co="$COPTIONS" -pot=results.pot $AD
