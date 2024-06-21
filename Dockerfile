# Based on the official qbittorrent-nox image
FROM qbittorrentofficial/qbittorrent-nox:latest

WORKDIR /opt

# Make directories
RUN mkdir -p /downloads /config/qBittorrent /etc/qbittorrent

# Install WireGuard and some other dependencies some of the scripts in the container rely on.
RUN apk --no-cache --update-cache update \
    && apk --no-cache --update-cache add \
    bash \
    curl \
    iputils-ping \
    ipcalc \
    iptables \
    jq \
    kmod \
    moreutils \
    net-tools \
    libnatpmp \
    openresolv \
    procps \
    wireguard-tools

# Remove src_valid_mark from wg-quick
RUN sed -i /net\.ipv4\.conf\.all\.src_valid_mark/d `which wg-quick`

VOLUME /config /downloads

ADD start.sh /
ADD qbittorrent/ /etc/qbittorrent/

RUN chmod +x /start.sh
RUN chmod +x /etc/qbittorrent/*.sh

EXPOSE 8080
EXPOSE 8999
EXPOSE 8999/udp
ENTRYPOINT ["/bin/bash", "/start.sh"]