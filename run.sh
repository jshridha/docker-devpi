#!/bin/bash
set -e
#set -x
export DEVPI_SERVERDIR=/data/server
export DEVPI_CLIENTDIR=/data/client
if [ $DEVPI_DEBUG = "true" ]; then export DEBUG=--debug; echo "Debugging server"; fi

devpi-server $DEBUG --host 0.0.0.0 --port 3141
