#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            https://s3.amazonaws.com/json-c_releases/releases/json-c-0.15.tar.gz
mkdir build &&
cd    build &&
cmake -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_STATIC_LIBS=OFF    \
      .. &&
make
cd build
make install

epilog

