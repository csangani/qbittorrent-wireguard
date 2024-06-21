# [qBittorrent](https://github.com/qbittorrent/qBittorrent) and WireGuard

Docker container which runs [qBittorrent](https://github.com/qbittorrent/qBittorrent)-nox (headless) latest client while connecting to WireGuard with iptables killswitch to prevent IP leakage when the tunnel goes down.

# Specs and Features
* Base: Alpine Linux
* Supports amd64 and arm64 architectures.
* [qBittorrent](https://github.com/qbittorrent/qBittorrent) from the official Docker repo (qbittorrentofficial/qbittorrent-nox:4.6.5-1)
* Uses the Wireguard VPN software.
* IP tables killswitch to prevent IP leaking when VPN connection fails.
* Configurable UID and GID for config files and /downloads for qBittorrent.
* BitTorrent port 8999 exposed by default.
* Automatically restarts the qBittorrent process in the event of it crashing.

# Credits
* [DyonR/docker-qBittorrentvpn](https://github.com/DyonR/docker-qbittorrentvpn)
* [tenseiken/docker-qbittorrent-wireguard](https://github.com/tenseiken/docker-qbittorrent-wireguard)