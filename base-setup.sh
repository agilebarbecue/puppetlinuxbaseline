#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive 

yes | unminimize && apt-get install -y man-db

apt-get -yq install build-essential \
        adduser \
        automake \
        ca-certificates \
        coreutils \
        dnsutils \
        file \
        findutils \
        iptables \
        lsof \
        net-tools \
        strace \
        sudo \
        tree \
        tzdata \
        xz-utils \
        zip \
        unzip \
        ubuntu-desktop \
        g++ \
        winbind \
        libnss-winbind \
        perl-doc \
        libavcodec-extra \
        mesa-utils \
        libgsm1-dev \
        libspeex-dev \
        libtheora-dev \
        ubuntu-restricted-extras \
        vlc \
        mplayer \
        libvorbis-dev \
        p7zip-rar \
        p7zip-full \
        unrar \
        vim-gnome \
        keychain \
        bup \
        ssh \
        x264 \
        x265 \
        ffmpeg \
        libbz2-dev \
        libgdbm-dev \
        libsqlite3-dev \
        libreadline-dev \
        libncurses-dev \
        libssl-dev \
        zlib1g-dev \
        liblzma-dev \
        tk-dev \
        silversearcher-ag \
        gitk \
        gimp \
        audacity \
        virt-viewer \
        curl \
        wget \
        xcape \
        jq \
        tmux \
        cifs-utils \
        htop \
        git \
        subversion \
        samba \
        perl \
        ruby \
        python3 \
        python3-pip \
        python3-venv \
        r-base \
        r-base-core \
        r-base-dev \
        dos2unix \
        openvpn \
        sharutils \
        iotop \
        tig \
        cmake \
        nmap \
        telnet \
        firefox \
        docker.io \
        opensc \
        opensc-pkcs11

