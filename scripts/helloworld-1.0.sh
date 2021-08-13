#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=helloworld
export VERSION=1.0
export URL=https://blog.packagecloud.io
export SOURCE=helloworld-1.0.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
cd $__build_dir_
make PREFIX=/usr %{?_smp_mflags}
cd $__build_dir_
make PREFIX=/usr DESTDIR=$SYSROOT install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
