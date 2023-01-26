
#!/bin/bash


install_ut(){
    cd /tmp
    git clone https://github.com/boost-ext/ut.git
    cd ut
    cmake -Bbuild -H. -DBOOST_UT_DISABLE_MODULE=ON
    cd build  
    make -j4 
    sudo make install    
}

install_ut