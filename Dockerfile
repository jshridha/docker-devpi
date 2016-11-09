FROM python:3

ENV DEVPI_VERSION=4.1.1
ENV DEVPI_SERVERDIR=/data/server DEVPI_CLIENTDIR=/data/client

RUN apt-get update && \
    apt-get install -y supervisor unzip && \
#    apt-get install -y --no-install-recommends python-pip python-setuptools python-wheel && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD *.sh /

ADD install /tmp

RUN /tmp/install_devpi.sh

RUN pip install "devpi-client==2.7.0" "devpi-web==3.1.1"

VOLUME /mnt

EXPOSE 3141

ADD *.conf /etc/supervisor/conf.d/

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf", "-n"]
