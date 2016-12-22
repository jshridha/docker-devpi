#!/bin/bash
set -e
#set -x

if [ $DEVPI_DEBUG = "true" ]; then export DEBUG=--debug; echo "Debugging server"; fi

STARTUP_COMMAND="$DEBUG --host 0.0.0.0 --serverdir $DEVPI_SERVERDIR --port $DEVPI_SERVERPORT"

if [ -z ${DEVPI_OUTSIDE+x} ]; then
  echo NOT SETTING OUTSIDE URL
else
  echo "OUTSIDE URL SET"
  STARTUP_COMMAND="$STARTUP_COMMAND --outside-url $DEVPI_OUTSIDE"
fi

devpi-server $STARTUP_COMMAND
