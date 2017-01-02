#!/bin/bash
set -e

pip install wheel

pip download --no-binary :all: --no-dependencies -d /tmp devpi-server==$DEVPI_VERSION
cd /tmp
tar xzvf devpi-server-$DEVPI_VERSION.tar.gz

cd /tmp/devpi-server-$DEVPI_VERSION/devpi_server
cp /tmp/bodysize.patch .
patch < bodysize.patch
rm bodysize.patch
cd ..
python setup.py -q bdist_wheel
cd dist
pip install devpi_server-*.whl

cd /
