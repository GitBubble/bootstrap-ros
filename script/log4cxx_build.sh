#! /usr/bin/bash

cd (dirname "$0")

cd $DEP/utils/log4cxx_0.10.0

./configure --prefix=/usr

make -j32

make install