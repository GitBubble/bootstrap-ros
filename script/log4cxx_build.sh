#! /usr/bin/bash

cd $(dirname "$0")

source ./env.sh

cd $DEP/utils/log4cxx-0.10.0

./configure --prefix=/usr

make -j32

make install
