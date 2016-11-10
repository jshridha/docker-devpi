#!/bin/bash
set -e
#set -x

if [ $DEVPI_DEBUG = "true" ]; then export DEBUG=--debug; echo "Debugging server"; fi

devpi-server $DEBUG --host 0.0.0.0 --serverdir $DEVPI_SERVERDIR --port $DEVPI_SERVERPORT
