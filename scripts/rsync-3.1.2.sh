#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=rsync
export VERSION=3.1.2
export URL=https://www.samba.org/ftp/rsync/src/rsync-3.1.2.tar.gz
export SOURCE=rsync-3.1.2.tar.gz
rsync is a replacement for rcp (and scp) that has many more features. It uses the “rsync algorithm” which provides a very fast method of syncing remote files. It does this by sending just the differences in the files across the link, without requiring that both sets of files are present at one end of the link beforehand.
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
sudo apt install doxygen
./configure --prefix=$SYSROOT/usr \
--host=riscv64-unknown-linux-gnu &&
cd $__build_dir_
make -j8
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
