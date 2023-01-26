#!/bin/bash

install_gcc(){
    # add-apt-repository -y 'deb http://mirrors.kernel.org/ubuntu hirsute main universe'
    add-apt-repository -y ppa:ubuntu-toolchain-r/test
    apt update -y
    apt upgrade -y
    apt install -y build-essential
    apt install -y gcc-11 g++-11 cpp-11
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 100 --slave /usr/bin/g++ g++ /usr/bin/g++-11 --slave /usr/bin/gcov gcov /usr/bin/gcov-11
}

install_cmake()
{
    apt install -y cmake
}

install_gcc
install_cmake