#! /user/bin/bash

source ./env.sh

cd $DEP/basic/libtool-2.4.6

./configure --prefix=/usr
make -j32
make install
