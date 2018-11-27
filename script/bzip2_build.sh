# /usr/bin/bash

cd (dirname "$0")

source env.sh

cd $DEP/utils/bzip2-1.0.6

# clear the old one
sudo rm /usr/bin/bzip2 /usr/bin/bunzip2 /usr/bin/bzcat /usr/bin/bzip2recover

make -f Makefile-libbz2_so

make

make install
 
