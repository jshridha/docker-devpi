FROM python:3

ENV DEVPI_VERSION=4.1.1
ENV DEVPI_SERVERDIR=/data/server DEVPI_CLIENTDIR=/data/client DEVPI_SERVERPORT=3140

RUN apt-get update && \
    apt-get install -y --no-install-recommends supervisor unzip nginx && \
#    apt-get install -y --no-install-recommends python-pip python-setuptools python-wheel && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD install /tmp

RUN /tmp/install_devpi.sh && /tmp/install_nginx.sh && rm -rv /tmp/*

RUN pip install "devpi-client==2.7.0" "devpi-web==3.1.1"

ADD run.sh /

ADD nginx/nginx-devpi.conf /etc/nginx/sites-enabled/default

ADD *.conf /etc/supervisor/conf.d/

VOLUME /data

EXPOSE 80

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf", "-n"]
