#!/bin/bash
# Usage:
#       ./run-spec.sh example.spec

#export CC=clang
#export CFLAGS="--gcc-toolchain=$TOOLCHAIN --sysroot=$SYSROOT --target=$TARGET -march=$MARCH -Xclang -load -Xclang ~/AFL-2.57b/afl-llvm-pass.so ~/AFL-2.57b/afl-llvm-rt-64.o"

export SPECS=~/rpmbuild/SPECS
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD

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

# generate rpm package automatically
if [ $? -eq 0 ]; then
        cd $SPECS
#        rpmbuild -bb $SPECFILE
fi
