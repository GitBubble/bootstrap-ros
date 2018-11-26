#! /usr/bin/bash

cd "$(dirname "$0")"
pwd
source env.sh
echo $DEP
cd $DEP/python-pkg/

pkg_list=$(ls)
echo $pkg_list
for pkg in $pkg_list
  do
    cd $pkg
    python setup.py install
    cd ..
done
