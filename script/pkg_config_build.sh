#! /usr/bin/bash

source ./env.sh

cd $DEP/basic/pkg-config-0.29.1/

./configure --prefix=/usr
make 
make install


