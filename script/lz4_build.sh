# /usr/bin/bash

cd (dirname "$0")

source env.sh

cd $DEP/utils/lz4-0.0~r131

cd ./lib && make -j32 
cp liblz4.so /usr/lib
cd ..
make -j32  #make exec
cp programs/lz4 /usr/bin   
cp ./lib/lz4.h /usr/include
