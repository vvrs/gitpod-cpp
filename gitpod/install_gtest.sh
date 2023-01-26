#!/bin/bash
install_dependencies()
{
    apt update -y
    apt install -y libgtest-dev googletest
}

install_gtest(){
    cd /usr/src/googletest/googletest && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    cp lib/*.a /usr/lib && \
    mkdir /usr/local/lib/googletest && \
    ln -s /usr/lib/libgtest.a /usr/local/lib/googletest/libgtest.a && \
    ln -s /usr/lib/libgtest_main.a /usr/local/lib/googletest/libgtest_main.a
}

install_dependencies
install_gtest