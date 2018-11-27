#! /usr/bin/bash

cd (dirname "$0")

source env.sh

cd $DEP/utils/openssl-1.0.2g

./configure --prefix=/usr &&

make depend -j32 &&

make -j32 &&

make install
