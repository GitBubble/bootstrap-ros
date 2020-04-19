with ubuntu 18.04:


step1:

$sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

$sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654


step2:

$sudo apt-get update
$sudo apt-get install python3-rosdep python3-rosinstall-generator python3-wstool python3-rosinstall build-essential
$sudo rosdep init 
$rosdep update

step3:

git clone --> this repo


step4:

we use the melodic dependencies [optional--], also we can rosolve dependencies later with pip3
rosdep install --from-paths src --ignore-src --rosdistro melodic -y


step5:

$ export ROS_PYTHON_VERSION=3 
$ sudo ./src/catkin/bin/catkin_make_isolated --install --install-space /opt/ros/melodic -DCMAKE_BUILD_TYPE=Release

or just

export ROS_PYTHON_VERSION=3 
catkin build --cmake-args -DPYTHON_VERSION=3.6

with the help of 

- apt install python3-catkin-tools
- pip3 install empy
- sudo apt install python3-netifaces
- sudo apt-get install python3-rospkg


step6:

source ./devel/setup.bash

run roscore with python3 happily on ubuntu 18.04






