# ROS Cross Platform Porting Guide

   The whole stack of ROS software have a complicated dependency tree. With the benefit of good design in ROS philosophy

we can port the ROS to the non-official platform and architecture.

   The keypoint of porting work is figuring out dependency hell. it generally means the whole software should be built from source. Yeah,Cook By Yourself.

ROS software can be group to 4 parts 
 -- python package , include compile utility and ROS python package.
 -- normal C/C++ package managed by CMake/AutoTools/Make, this could be complied by GCC/GMAKE.
 -- ROS C/C++ package, we can utilize catkin tools to do some parallel compiling work.
 -- The toolchain,which include GCC,Steel-Bank Common Lisp,etc. 


1, prepare basic tools  

   *./script/init.sh*

2, build toolchain (optional)

*./toolchain/gcc_download_build.sh* 

3, build dependencies  

   *./script/basic_build.sh*    
   *./script/python_pkg_build.sh*   
   *./script/utils_build.sh*     

4, build ROS

*./build.sh*



  
 
 



