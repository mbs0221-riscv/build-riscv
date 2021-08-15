#!/bin/bash
# Usage:
#       ./run.sh example.spec

#export SYSROOT=$ROOTFS
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD

info=$(./convert.sh $1)
echo $info

filename=$(echo $info | sed 's/.* in //')
cat $filename

# change directory
cd $(dirname $filename)

# run generated scripts
bash -v $(basename $filename)
