ARG     REGISTRY=
ARG     BASE=pihole/pihole
ARG     TAG=2025.08.0
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
        apt install --no-install-recommends -y ${PKGS} && \
        apt upgrade --autoremove --purge -y

# Don't remove the apt lists because this is intended to be long-running image which auto-upgrades.
