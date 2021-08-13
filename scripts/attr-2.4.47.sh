#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=attr
export VERSION=2.4.47
export URL=http://download.savannah.gnu.org/releases/attr/attr-2.4.47.src.tar.gz
export SOURCE=attr-2.4.47.src.tar.gz
#description
#pre
#post
#prep
#wget http://download.savannah.gnu.org/releases/attr/attr-2.4.47.src.tar.gz
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in &&
INSTALL_USER=root  \
INSTALL_GROUP=root \
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --enable-lib64=yes \
            --with-sysroot=$SYSROOT
#build
cd $__build_dir_
make clean && make -j$(nproc)
#install
cd $__build_dir_
make install install-dev install-lib &&
chmod -v 755 $SYSROOT/usr/lib/libattr.so &&
mkdir $SYSROOT/lib/
mv -v $SYSROOT/usr/lib/libattr.so.* $SYSROOT/lib/ &&
ln -sfv ../../lib/libattr.so.1 $SYSROOT/usr/lib/libattr.so
#clean

#files
#defattr(-,root,root,-)
#config
#doc
test $? -eq 0 || exit 0
cd $__build_dir_
