#! /usr/bin/bash


MPFR=mpfr-2.4.2
GMP=gmp-4.3.2
MPC=mpc-1.0.3


wget ftp://gcc.gnu.org/pub/gcc/infrastructure/$MPFR.tar.bz2 || exit 1
tar xjf $MPFR.tar.bz2 || exit 1
ln -sf $MPFR mpfr || exit 1

wget ftp://gcc.gnu.org/pub/gcc/infrastructure/$GMP.tar.bz2 || exit 1
tar xjf $GMP.tar.bz2  || exit 1
ln -sf $GMP gmp || exit 1

wget ftp://gcc.gnu.org/pub/gcc/infrastructure/$MPC.tar.gz || exit 1
tar xzf $MPC.tar.gz || exit 1
ln -sf $MPC mpc || exit 1

rm $MPFR.tar.bz2 $GMP.tar.bz2 $MPC.tar.gz || exit 1

#if [ ! -f ./mpfr-2.4.2.tar.gz ]; then 
#  wget https://mirrors.ustc.edu.cn/gnu/mpfr/mpfr-2.4.2.tar.gz 
#fi
#
#
#
#if [ ! -f ./mpc-1.1.0.tar.gz ]; then 
#  wget https://mirrors.ustc.edu.cn/gnu/mpc/mpc-1.1.0.tar.gz 
#fi
#
if [ ! -f ./gcc-4.8.0.tar.gz ]; then 
   wget https://mirrors.ustc.edu.cn/gnu/gcc/gcc-4.8.0/gcc-4.8.0.tar.gz -O gcc-4.8.0.tar.gz
   tar xzvf gcc-4.8.0.tar.gz
fi


mkdir objdir

cd objdir

../gcc-4.8.0/configure --prefix=/opt/gcc --disable-multilib --enable-languages=c,c++
#../gcc-4.8.0/contrib/
make -j32
make install

