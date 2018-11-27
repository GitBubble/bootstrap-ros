# /usr/bin/bash

cd (dirname "$0")

cd $DEP/utils/console-bridge-0.3.2

mkdir /usr/src/gtest/

cp -r test/gtest/src /usr/src/gtest/

cmake -DCMAKE_INSTALL_PREFIX=/usr

make -j32

make test

make install
