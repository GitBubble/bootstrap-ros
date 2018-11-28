# /usr/bin/bash

cd $(dirname "$0")

source ./env.sh
echo $DEP
cd $DEP/utils/tinyxml-2.6.2

make

cp libtinyxml.so /usr/lib
