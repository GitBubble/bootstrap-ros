#! /usr/bin/bash

cd (dirname "$0")

source env.sh

cd $DEP/utils/gtest-1.7.0

./configure --prefix=/usr

make -j32

# gtest do not support make install, we have to copy manually

cp ./lib/.libs/libgtest_main.so /usr/lib

cp ./lib/.libs/libgtest.so /usr/lib

cp -r ./include/gtest  /usr/include
