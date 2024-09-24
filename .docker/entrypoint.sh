#!/bin/bash

RUNTIME_DEST=/help_crack/runtime

# Download dwpa hc runtime
wget -nc -P $RUNTIME_DEST "${PUBLIC_URL}hc/help_crack.py"
wget -nc -P $RUNTIME_DEST "${PUBLIC_URL}hc/help_crack.py.version"
wget -nc -P $RUNTIME_DEST "${PUBLIC_URL}hc/CHANGELOG"

chmod +x "${RUNTIME_DEST}/help_crack.py"

AD="" # -ad=""

cd $RUNTIME_DEST && ./help_crack.py -co="$COPTIONS" -pot=results.pot $AD