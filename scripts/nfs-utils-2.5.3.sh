#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=nfs-utils
export VERSION=2.5.3
export URL=https://ftp.osuosl.org/pub/blfs/conglomeration/nfs-utils/nfs-utils-2.5.3.tar.xz
export SOURCE=nfs-utils-2.5.3.tar.xz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
cd $__build_dir_
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/opt/sqlite3/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr \
--host=riscv64-unknown-linux-gnu \
--enable-silent-rules \
--enable-shared \
--disable-gss \
--disable-nfsv4 \
--disable-nfsv41 \
--disable-uuid &&
make -j8
cd $__build_dir_
sudo make install                          &&
sudo chmod u+w,go+r /usr/sbin/mount.nfs    &&
sudo chown nobody.nogroup /var/lib/nfs
sudo
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
