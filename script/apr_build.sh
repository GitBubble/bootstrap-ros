#! /usr/bin/bash

cd $(dirname "$0")

source env.sh

cd $DEP/utils/apr-1.5.2
./configure --prefix=/usr --disable-static --with-installbuilddir=/usr/share/apr-1/build &&
make -j32
make install

cd $DEP/utils/apr-util-1.5.4
./configure --prefix=/usr --with-gdbm=/usr --with-openssl=/usr --with-crypto --with-apr=/usr &&
make -j32
make install

