#FROM ubuntu:xenial
FROM ubuntu:xenial-20191108

RUN set -ex; \
  export DEBIAN_FRONTEND=noninteractive; \
  export DEBCONF_NONINTERACTIVE_SEEN=true; \
  echo 'tzdata tzdata/Areas select Etc' | debconf-set-selections; \
  echo 'tzdata tzdata/Zones/Etc select UTC' | debconf-set-selections && \
  apt-get update -y && \
  apt-get upgrade -y && \
  apt-get install -qqy --no-install-recommends \
    software-properties-common \
    ca-certificates \
    tzdata \
    bash \
    sudo \
    passwd \
    openssl \
    ssh \
    git \
    curl \
    wget \
    man-db \
    manpages \
    gnupg2 \
    && \
  groupadd -f "sudo" && \
  useradd -m -s /bin/zsh -G sudo "wsl" && \
  printf "wsl\nwsl\n" | passwd "wsl" && \
  printf "wsl\nwsl\n" | passwd "root" && \
  printf "%%sudo ALL=(ALL) NOPASSWD:ALL\n" > /etc/sudoers.d/passwordless
