ARG     REGISTRY=
ARG     BASE=pihole/pihole
ARG     TAG=latest
FROM    ${REGISTRY}${BASE}:${TAG}

ENV     DEBIAN_FRONTEND=noninteractive

ENV     PKGS="\
bind9-host \
byobu \
curl \
iproute2 \
less \
mtr-tiny \
netcat-openbsd \
rsync \
screen \
strace \
unattended-upgrades \
wget \
"

RUN     apt update && \
        apt install --no-install-recommends --autoremove --purge -y ${PKGS} && \
        apt upgrade -y
