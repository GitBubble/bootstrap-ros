#! /usr/bin/bash

source ./env.sh

cd $DEP/basic/sbcl-1.3.1
 
echo '"1.3.1"' > version.lisp-expr

sh make.sh --prefix=/usr --fancy
sh install.sh
