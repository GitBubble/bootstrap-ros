# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/arthur/ros_varient/sim-install/cmake-3.5.1/Bootstrap.cmk/cmake

# The command to remove a file.
RM = /home/arthur/ros_varient/sim-install/cmake-3.5.1/Bootstrap.cmk/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/arthur/ros_varient/sim-install/cmake-3.5.1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/arthur/ros_varient/sim-install/cmake-3.5.1

# Include any dependencies generated for this target.
include Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/depend.make

# Include the progress variables for this target.
include Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/progress.make

# Include the compile flags for this target's objects.
include Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/flags.make

Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/foo.cpp.o: Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/flags.make
Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/foo.cpp.o: Tests/FindPackageModeMakefileTest/foo.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/arthur/ros_varient/sim-install/cmake-3.5.1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/foo.cpp.o"
	cd /home/arthur/ros_varient/sim-install/cmake-3.5.1/Tests/FindPackageModeMakefileTest && /usr/bin/g++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/foo.dir/foo.cpp.o -c /home/arthur/ros_varient/sim-install/cmake-3.5.1/Tests/FindPackageModeMakefileTest/foo.cpp

Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/foo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/foo.dir/foo.cpp.i"
	cd /home/arthur/ros_varient/sim-install/cmake-3.5.1/Tests/FindPackageModeMakefileTest && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/arthur/ros_varient/sim-install/cmake-3.5.1/Tests/FindPackageModeMakefileTest/foo.cpp > CMakeFiles/foo.dir/foo.cpp.i

Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/foo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/foo.dir/foo.cpp.s"
	cd /home/arthur/ros_varient/sim-install/cmake-3.5.1/Tests/FindPackageModeMakefileTest && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/arthur/ros_varient/sim-install/cmake-3.5.1/Tests/FindPackageModeMakefileTest/foo.cpp -o CMakeFiles/foo.dir/foo.cpp.s

Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/foo.cpp.o.requires:

.PHONY : Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/foo.cpp.o.requires

Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/foo.cpp.o.provides: Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/foo.cpp.o.requires
	$(MAKE) -f Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/build.make Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/foo.cpp.o.provides.build
.PHONY : Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/foo.cpp.o.provides

Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/foo.cpp.o.provides.build: Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/foo.cpp.o


# Object files for target foo
foo_OBJECTS = \
"CMakeFiles/foo.dir/foo.cpp.o"

# External object files for target foo
foo_EXTERNAL_OBJECTS =

Tests/FindPackageModeMakefileTest/libfoo.a: Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/foo.cpp.o
Tests/FindPackageModeMakefileTest/libfoo.a: Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/build.make
Tests/FindPackageModeMakefileTest/libfoo.a: Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/arthur/ros_varient/sim-install/cmake-3.5.1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libfoo.a"
	cd /home/arthur/ros_varient/sim-install/cmake-3.5.1/Tests/FindPackageModeMakefileTest && $(CMAKE_COMMAND) -P CMakeFiles/foo.dir/cmake_clean_target.cmake
	cd /home/arthur/ros_varient/sim-install/cmake-3.5.1/Tests/FindPackageModeMakefileTest && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/foo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/build: Tests/FindPackageModeMakefileTest/libfoo.a

.PHONY : Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/build

Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/requires: Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/foo.cpp.o.requires

.PHONY : Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/requires

Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/clean:
	cd /home/arthur/ros_varient/sim-install/cmake-3.5.1/Tests/FindPackageModeMakefileTest && $(CMAKE_COMMAND) -P CMakeFiles/foo.dir/cmake_clean.cmake
.PHONY : Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/clean

Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/depend:
	cd /home/arthur/ros_varient/sim-install/cmake-3.5.1 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/arthur/ros_varient/sim-install/cmake-3.5.1 /home/arthur/ros_varient/sim-install/cmake-3.5.1/Tests/FindPackageModeMakefileTest /home/arthur/ros_varient/sim-install/cmake-3.5.1 /home/arthur/ros_varient/sim-install/cmake-3.5.1/Tests/FindPackageModeMakefileTest /home/arthur/ros_varient/sim-install/cmake-3.5.1/Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Tests/FindPackageModeMakefileTest/CMakeFiles/foo.dir/depend

