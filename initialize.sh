#!/bin/bash
set -e
#set -x
export DEVPI_SERVERDIR=/data/server
export DEVPI_CLIENTDIR=/data/client
[[ -f $DEVPI_SERVERDIR/.serverversion ]] || initialize=yes

if [[ $initialize = yes ]]; then
  devpi use http://localhost:3141
  devpi login root --password=''
  devpi user -m root password="${DEVPI_PASSWORD}"
  devpi index -y -c public pypi_whitelist='*'
fi
