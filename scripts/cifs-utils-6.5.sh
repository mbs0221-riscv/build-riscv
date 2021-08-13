#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=cifs-utils
export VERSION=6.5
export URL=https://ftp.samba.org/pub/linux-cifs/cifs-utils/cifs-utils-6.5.tar.bz2
export SOURCE=cifs-utils-6.5.tar.bz2
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
#export ROOTSBINDIR=$SYSROOT/sbin
./configure --prefix=$SYSROOT/usr \
--host=riscv64-unknown-linux-gnu \
--disable-pam \
--disable-systemd
cd $__build_dir_
sed -i '303s/^/\/\//' config.h
sed -i '312s/^/\/\//' config.h
make
cd $__build_dir_
sudo make install
sudo
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
