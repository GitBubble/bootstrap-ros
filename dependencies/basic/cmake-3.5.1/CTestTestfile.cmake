# CMake generated Testfile for 
# Source directory: /home/arthur/ros_varient/sim-install/cmake-3.5.1
# Build directory: /home/arthur/ros_varient/sim-install/cmake-3.5.1
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
include("/home/arthur/ros_varient/sim-install/cmake-3.5.1/Tests/EnforceConfig.cmake")
add_test(SystemInformationNew "/home/arthur/ros_varient/sim-install/cmake-3.5.1/bin/cmake" "--system-information" "-G" "Unix Makefiles")
subdirs(Source/kwsys)
subdirs(Utilities/KWIML)
subdirs(Utilities/cmzlib)
subdirs(Utilities/cmcurl)
subdirs(Utilities/cmcompress)
subdirs(Utilities/cmbzip2)
subdirs(Utilities/cmliblzma)
subdirs(Utilities/cmlibarchive)
subdirs(Utilities/cmexpat)
subdirs(Utilities/cmjsoncpp)
subdirs(Source)
subdirs(Utilities)
subdirs(Tests)
subdirs(Auxiliary)
