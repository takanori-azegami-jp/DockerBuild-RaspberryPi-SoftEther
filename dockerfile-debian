FROM alpine:3.16 as prep

ENV BUILD_VERSION=v4.41-9782-beta

RUN wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/archive/refs/tags/${BUILD_VERSION}.tar.gz \
    && mkdir -p /usr/local/src \
    && tar -x -C /usr/local/src/ -f ${BUILD_VERSION}.tar.gz \
    && rm ${BUILD_VERSION}.tar.gz

FROM debian:11.6 as build

COPY --from=prep /usr/local/src /usr/local/src

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    libncurses6 \
    libncurses-dev \
    libreadline8 \
    libreadline-dev \
    libssl1.1 \
    libssl-dev \
    wget \
    zlib1g \
    zlib1g-dev \
    zip \
    && cd /usr/local/src/SoftEtherVPN_Stable-* \
    && ./configure \
    && make \
    && make install \
    && touch /usr/vpnserver/vpn_server.config \
    && zip -r9 /artifacts.zip /usr/vpn* /usr/bin/vpn*

FROM debian:11.6-slim

COPY --from=build /artifacts.zip /

COPY entrypoint.sh  /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libncurses6 \
    libreadline8 \
    libssl1.1 \
    iptables \
    unzip \
    zlib1g \
    && unzip -o /artifacts.zip -d / \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x /entrypoint.sh \
    && rm /artifacts.zip \
    && rm -rf /opt \
    && ln -s /usr/vpnserver /opt \
    && find /usr/bin/vpn* -type f ! -name vpnserver -exec bash -c 'ln -s {} /opt/$(basename {})' \;

WORKDIR /usr/vpnserver/

VOLUME ["/usr/vpnserver/server_log/", "/usr/vpnserver/packet_log/", "/usr/vpnserver/security_log/"]

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 500/udp 4500/udp 5555/tcp

CMD ["/usr/bin/vpnserver", "execsvc"]
