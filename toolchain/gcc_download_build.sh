#! /usr/bin/bash


MPFR=mpfr-2.4.2
GMP=gmp-4.3.2
MPC=mpc-1.0.3

# todo: check to see if we cant eliminate libc-devel
yum -y install compat-glibc glibc-devel
yum -y install gcc gcc-c++

#
if [ ! -f ./gcc-4.8.0.tar.gz ]; then 
   wget https://mirrors.ustc.edu.cn/gnu/gcc/gcc-4.8.0/gcc-4.8.0.tar.gz -O gcc-4.8.0.tar.gz
   tar xzvf gcc-4.8.0.tar.gz
   cp ./download_prerequisites  ./gcc-4.8.0/contrib/download_prerequisites
   cd ./gcc-4.8.0  
   ./contrib/download_prerequisites
fi

cd ../
mkdir objdir

cd objdir

../gcc-4.8.0/configure --prefix=/opt --disable-multilib --enable-languages=c,c++
make -j32
make install

export CXX=/opt/bin/g++
export CC=/opt/bin/gcc
