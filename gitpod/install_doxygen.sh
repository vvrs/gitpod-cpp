#!/bin/bash
install_doxygen(){
    cd /tmp
    DEBIAN_FRONTEND=noninteractive && sudo apt-get -y --no-install-recommends remove doxygen
    DEBIAN_FRONTEND=noninteractive && sudo apt-get update && sudo apt-get install -y --no-install-recommends graphviz flex bison
    git clone -b Release_1_9_5 https://github.com/doxygen/doxygen.git
    cd doxygen
    mkdir build
    cd build
    cmake -G "Unix Makefiles" ..
    make -j$(nproc)
    sudo make install
}

install_doxygen