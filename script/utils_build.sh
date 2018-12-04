#! /usr/bin/bash

cd "$(dirname "$0")"
./gtest_build.sh
./googlemock_build.sh
./apr_build.sh
./bzip2_build.sh
./lz4_build.sh
./openssl_build.sh
./log4cxx_build.sh
./console_bridge_build.sh
./tinyxml_build.sh
