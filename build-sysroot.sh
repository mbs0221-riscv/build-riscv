#!/bin/bash
# Usage:
#       ./run-spec.sh example.spec

#export SYSROOT=$ROOTFS

export CC=riscv64-unknown-linux-gnu-gcc
export AR=riscv64-unknown-linux-gnu-ar 
export RANLIB=riscv64-unknown-linux-gnu-ranlib 
export STRIP=riscv64-unknown-linux-gnu-strip

export SPECS=~/rpmbuild/SPECS
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD

export SPECFILE=$1
export TEMPSPEC=temp.spec

cp $SPECFILE $TEMPSPEC
sed -i 's/%buildroot/$SYSROOT/g' $TEMPSPEC
cat $TEMPSPEC

rpmbuild -bi $TEMPSPEC 

exit 0

