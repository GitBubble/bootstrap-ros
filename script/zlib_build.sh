#! /usr/bin/bash

source ./env.sh

cd $DEP/basic/zlib-1.2.11

./configure --prefix=/usr
make 
make install


