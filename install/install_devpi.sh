#!/bin/bash
set -e

pip install wheel

wget https://bitbucket.org/hpk42/devpi/get/server-$DEVPI_VERSION.zip -O /tmp/server.zip
unzip /tmp/server.zip -d /tmp/src

cd /tmp/src/hpk42-devpi-*/server/devpi_server
cp /tmp/bodysize.patch .
patch < bodysize.patch
rm bodysize.patch
cd ..
python setup.py -q bdist_wheel
cd dist
pip install devpi_server-*.whl

cd /
rm -rv /tmp/*
