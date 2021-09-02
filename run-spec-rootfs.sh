#!/bin/bash
# Usage:
#       ./run-spec.sh example.spec

export CC=riscv64-unknown-linux-gnu-gcc
export AR=riscv64-unknown-linux-gnu-ar 
export RANLIB=riscv64-unknown-linux-gnu-ranlib 
export STRIP=riscv64-unknown-linux-gnu-strip

export SPECS=~/rpmbuild/SPECS
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD

PKG_CONFIG_PATH=$SYSROOT/lib/pkgconfig:$PKG_CONFIG_PATH
PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH

export BUILDROOT=/media/ubuntu/e60f0536-2914-4a9c-b357-65dd72c24ca1

export SPECFILE=$1

info=$(./convert.sh $SPECFILE)
echo $info

# content of generated scripts
filename=$(echo $info | sed 's/.* in //')
cat $filename

# change directory
cd $(dirname $filename)

# run generated scripts
bash $(basename $filename)
