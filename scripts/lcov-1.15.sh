#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            https://sourceforge.net/projects/ltp/files/Coverage%20Analysis/LCOV-1.15/lcov-1.15.tar.gz
export DESTDIR=$SYSROOT
make install
