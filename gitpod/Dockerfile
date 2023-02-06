FROM ubuntu:latest

### base ###
RUN yes | unminimize \
    && apt-get install -yq \
        asciidoctor \
        bash-completion \
        build-essential \
        git \
        git-lfs \
        htop \
        jq \
        less \
        locales \
        man-db \
        nano \
        software-properties-common \
        sudo \
        vim \
        multitail \
        lsb-release \
    && locale-gen en_US.UTF-8 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

### Install C/C++ compiler and associated tools ###
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        clang \
        lldb \
        lld \
        clang-format \
        clang-tidy \
        clang-tools \
        clangd \
        gdb \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    clang-format-12 \
    git \
    gdb \
    cmake \
    build-essential \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install conan
# Doxygen    
# COPY install_doxygen.sh /tmp
# RUN bash /tmp/install_doxygen.sh

ENV LANG=en_US.UTF-8

RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    # passwordless sudo for users in the 'sudo' group
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers
ENV HOME=/home/gitpod
WORKDIR $HOME
# custom Bash prompt
RUN { echo && echo "PS1='\[\e]0;\u \w\a\]\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \\\$ '" ; } >> .bashrc

USER gitpod