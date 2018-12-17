source ./script/common.func

MPFR=mpfr-2.4.2
GMP=gmp-4.3.2
MPC=mpc-1.0.3

os=$(JudgeOS)

# todo: check to see if we cant eliminate libc-devel
case ${os} in
  CentOS)
    yum -y install compat-glibc glibc-devel
    yum -y install gcc gcc-c++;;
  Ubuntu)
    apt install python-pip python-dev wget -y;;  
  *)
    ;;
esac

#
if [[ ! -f ./gcc-4.8.0.tar.gz ]]; then 
  wget https://mirrors.ustc.edu.cn/gnu/gcc/gcc-4.8.0/gcc-4.8.0.tar.gz -O gcc-4.8.0.tar.gz
  tar xvf gcc-4.8.0.tar.gz
  cp ./toolchain/download_prerequisites  ./gcc-4.8.0/contrib/download_prerequisites 
  cd ./gcc-4.8.0
  ./contrib/download_prerequisites
  cd ../
fi

mkdir -p objdir
cd objdir

../gcc-4.8.0/configure --prefix=/opt --disable-multilib --enable-languages=c,c++
make -j32
make install

export CXX=/opt/bin/g++
export CC=/opt/bin/gcc

