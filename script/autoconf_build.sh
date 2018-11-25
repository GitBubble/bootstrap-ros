#! /usr/bin/bash

source ./env.sh

cd $DEP/basic/autoconf-2.65/

./configure --prefix=/usr
make 
make install


