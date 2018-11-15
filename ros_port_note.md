-- ROS Porting Note

the whole stack of ROS software have a complicated dependency tree. With the benefit of good design in ROS philosophy

we can port the ROS to the non-official platform and architecture.

The keypoint of porting work is figuring out dependency hell. it means the whole software should be built from source.

ROS software can be group to three parts 
 -- python package , include compile utility and ROS python package
 -- Normal C/C++ package managed by CMake/AutoConf/Make, this could be complied by GCC/GMAKE
 -- ROS C/C++ package, we can utilize catkin tools to do some parallel compiling work.
 
Download source  
#pip install -U rosdep rosinstall_generator wstool rosinstall

(optional) ros distro database initilization
rosdep init  
add some old version distro info to 
/etc/ros/rosdep/sources.list.d/20-default.list
rosdep update
update cache in /root/.ros/rosdep/sources.cache
there is a database to maintain distro info here
ex: kinetic -> whole stack software version is list under
yaml https://raw.githubusercontent.com/ros/rosdistro/master/kinetic/distribution.yaml kinetic

#download now ....
rosinstall_generator ros_comm --rosdistro kinetic --deps --wet-only --tar > kinetic-ros_comm-wet.rosinstall  
wstool init -j8 src kinetic-ros _comm-wet.rosinstall   

# if you are in a virtual machine, you would like to have vboxtool , a gcc/gcc-g++/make is required 
 yum install "kernel-devel-uname-r == $(uname -r)"


centos which derived from redhat, can use lots RPM source from EPEL.  
 yum -y install libtool ( will install autoconf,automake,m4,perl...etc...    
 yum -y install gcc gcc-g++ make   
 -- # apr compile ready   
 -- # apr-util compile ready   
 -- # cmake 3.5.1 compile ready  
 -- # bzip2 compile ready   
 -- # 
 -- # 
 
 
 
 
 yum -y install epel-release    
 yum -y install python-pip    
 yum install libjpeg-turbo-devel  
 yum install glib-devel  
 yum install patch  

## libool detail: 
to analysiz libtool dependencies
 Installing:
 libtool              2.4.2-22.el7_3 
Installing for dependencies:
 autoconf            2.69-11.el7  
 automake            1.13.4-3.el7
 m4                  1.4.16-10.el7
 perl-Data-Dumper    2.145-3.el7
 perl-Test-Harness   3.28-3.el7 
 perl-Thread-Queue   3.02-2.el7

## cmake detail:
 ./configure --prefix=/usr/  
 gmake  
 make install  

## gtest build:
make install is not supported for gtest ..   
change cmakefile to generate libs  
cp so to /usr/lib/gtest    
cp h to /usr/include   

## bzip2 build:
sudo rm /usr/bin/bzip2 /usr/bin/bunzip2 /usr/bin/bzcat /usr/bin/bzip2recover
make -f Makefile-libbz2_so
*modify Makefile install path to /usr
make 
make install (this will copy header to /usr/include and will be used by boost etc 


## console_bridge compiled with gtest:
yum -y install epel-release  (optional)  
copy gtest src to /usr/src/gtest/src  
cmake -DCMAKE_INSTALL_PREFIX=/usr  
make -j32 && make install  

## log4cxx-0.10.0 compiled:
./configure --prefix=/usr  
make -j32 && make install  

## lz4-0.0.r131 compiled:
make -j32  
cp programs/lz4 /usr/bin   

## google-mock-1.7.0 complied:  
./configure --prefix=/usr     
make install is not supported   
cp ./lib/.libs/libgmock.so /usr/lib   
cp ./lib/.llibs/libgmock_main.so /usr/lib   

## tinyxml 2.6.2 compiled:
change makefile
  
`${LIB}: ${OBJS}  
        ${CXX} -o $@ ${LDFLAGS} ${OBJS}`   
make   

## sbcl compiled:  
seems sbcl need itself to build  
yum install sbcl  
sh make.sh
sh install.sh
default installed to /usr/local/bin
change location : by ->  sh make.sh --prefix=/usr --fancy

## pkg-config compiled:
step1: compile pkg-config/glib/ (require aclocal-1.15   yum install automake wont make in centos cause its version is 1.13.4 )
step:build pkg-config itself

# Now python time
## empy
python setup.py install 

## defusedxml  
yum install python2-pip  (8.1.2-6.el7 ,   
pip install setuptools==40.5.0   
yum install python-devel  
python setup.py install     
(there is a patch here ...need i patch it manually ?     

## nose-1.3.7
python setup.py install

## paramiko-1.16.0
pip install ecdsa>=0.11
pip install pycrypto>=2.1,!=2.4
python setup.py install


## pillow 3.1.2
yum install libjpeg-turbo-devel
yum install zlib  ( zlib-1.2.7-17.e17
yum install zlib-devel  ( 1.2.7-17.el7
python setup.py install

## pyyaml-3.11
python setup.py install

# Now ready to using catkin tools....
pip install catkin-tools
 ...collecting  catkin_tools-0.4.4.tar.gz   
 ...collecting  catkin_pkg-0.4.9.tar.gz  
 ...collecting  osrf-pycommon>0.1.1 -> osrf-pycommon-0.1.5.tar.gz   
 ...collecting  docutils-0.14-py2-none-any.whl   
 ...collecting  python_dateutil-2.7.5-py2.py3-none-any.whl   
 ...collecting  pyparsing-2.3.0-py2.py3-none-any.whl  
 ...collecting  trollius-2.2.tar.gz  
 ...collecting  six>=1.5 -> six-1.11.0-py2.py3-none-any.whl  
 ...collecting  futures-3.2.0-py2-none-any.whl  
 
but boost is requested

## compile boost-1.58
require bzip2.h
./bootstrap.sh
./b2
cp -r ./boost/ /usr/include
cp -r ./stage/lib /usr/lib


 
I have done some port test on centos. the following work has been done
 
1, python packages are portable on most of the linux platform.
yum install pip      
pip install empy   
pip install setuptools==40.5.0  
pip install jinja2  
pip install ipapython   

2, extract the source 
for a in $(ls  *.tar.gz ); do tar xzvf $a; done    
for a in $(ls  *.bz2 ); do tar xjf $a; done    
for a in $(ls  *.xz ); do tar xJf $a; done    
gzip -d pkg-config_0.29.1-0ubuntu1.diff.gz   
patch -p1 -i  pkg-config_0.29.1-0ubuntu1.diff   

3, build the other binaries from source

currently use from rpm source include(to be compile from source)   
yum install zlib-devel   
yum install libyaml-devel  
yum install boost-devel  
yum install tinyxml  
yum install tinyxml-devel  
yum install gtest  



