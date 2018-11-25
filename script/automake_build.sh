#! /usr/bin/bash

source ./env.sh

cd $DEP/basic/automake-1.15

./configure --prefix=/usr
make 
make install


