#! /usr/bin/bash

source env.sh

cd $DEP/basic/cmake-3.5.1/

./configure --prefix=/usr/  
gmake  
make install  
