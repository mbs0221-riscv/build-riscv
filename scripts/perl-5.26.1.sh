#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=perl
export VERSION=5.26.1
export URL=http://www.cpan.org/src/5.0/perl-5.26.1.tar.xz
export SOURCE=perl-5.26.1.tar.xz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
export export LD_LIBRARY_PATH=$SYSROOT/lib:$SYSROOT/usr/lib:$SYSROOT/usr/local/lib$LD_LIBRARY_PATH
sh Configure -Dcc=riscv64-unknown-linux-gnu-gcc \
-Dprefix=$SYSROOT/opt/perl5 \
-Dusethreads \
-Duseshrplib \
cd $__build_dir_
make -j$(nproc)
make -j$(nproc) test
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
