#!/bin/bash
source ../build-utils.sh
export NAME=expect
export VERSION=5.45.4
# Release:        1#{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://prdownloads.sourceforge.net/expect/expect5.45.4.tar.gz
export SOURCE=expect5.45.4.tar.gz
# Requires(post): info
# Requires(preun): info
#description
# A helloworld program from the packagecloud.io blog!
#pre
#post
#prep
#wget http://prdownloads.sourceforge.net/expect/expect5.45.4.tar.gz
#setup
setup -n expect5.45.4
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
#build
build
make -j$(nproc)
#install
install
make install
#clean

#files
# path: /usr
#defattr(-,root,root,-)
#config
#doc
epilog
