#!/bin/bash
set -e
#set -x
export DEVPI_SERVERDIR=/data/server
export DEVPI_CLIENTDIR=/data/client
export DONEFILE=$DEVPI_SERVERDIR/.done_initialize

# Sleep for 10 seconds to wait for server to get online
sleep 10

[[ -f $DONEFILE ]] || initialize=yes

if [[ $initialize = yes ]]; then
  devpi use http://localhost:3141
  devpi login root --password=''
  devpi user -m root password="${DEVPI_PASSWORD}"
  devpi index -y -c public pypi_whitelist='*'
fi

touch $DONEFILE
