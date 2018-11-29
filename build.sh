#! /usr/bin/bash

catkin config -s ./osrf-distro-source/bare-bone/ -i ./release --install --merge-install -j12

catkin build
