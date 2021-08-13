#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=rsync
export VERSION=3.1.2
export URL=https://www.samba.org/ftp/rsync/src/rsync-3.1.2.tar.gz
export SOURCE=rsync-3.1.2.tar.gz
#description
rsync is a replacement for rcp (and scp) that has many more features. It uses the “rsync algorithm” which provides a very fast method of syncing remote files. It does this by sending just the differences in the files across the link, without requiring that both sets of files are present at one end of the link beforehand.
#pre
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
sudo apt install doxygen
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu &&
#build
cd $__build_dir_
make -j$(nproc)
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
