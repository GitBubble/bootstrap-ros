#! /usr/bin/bash

cd "$(dirname "$0")"

./autoconf_build.sh
./automake_build.sh
./libtool_build.sh
./pkg_config_build.sh
./cmake_build.sh
# sbcl need zlib.sh
./zlib_build.sh
#./sbcl_bootstrap.sh
