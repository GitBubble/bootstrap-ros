#! /usr/bin/bash

VER="1.58.0"
FILE="boost_1_58_0.tar.gz"
DIR="boost_1_58_0"

if [ ! -f ./$FILE ]; then 
  wget https://sourceforge.net/projects/boost/files/boost/$VER/$FILE/download -O $FILE
  tar xzvf $FILE
else
  rm -r boost_1_58_0
  tar xzvf $FILE
fi


cd $DIR
./bootstrap.sh 

./b2


sudo cp -r boost /usr/include/

sudo cp -P stage/lib/* /usr/lib
