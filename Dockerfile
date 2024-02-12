FROM t4skforce/docker-novnc:latest

ARG BUILD_DATE="2024-02-12T12:07:36Z"

RUN set -xe && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends wine && \
    rm -rf /var/lib/apt/lists && \
    mkdir -p /opt/winbox/ && \
    wget -q -c -O /opt/winbox/winbox64.exe "https://mt.lv/winbox64" && \
    find /usr/share/applications/ -type f -not -name 'tint2.desktop' -delete
COPY ./templates/. /
