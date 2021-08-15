#!/bin/bash
source ../build-utils.sh
export NAME=libcap
export VERSION=2.48
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.48.tar.xz
export SOURCE=libcap-2.48.tar.xz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
pre
post
prep
#wget https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.48.tar.xz
setup
build
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
export AR=riscv64-unknown-linux-gnu-ar
export RANLIB=riscv64-unknown-linux-gnu-ranlib
make -j$(nproc)
install
make install FAKEROOT=$SYSROOT
clean

# %files
# path: /
# %defattr(-,root,root,-)
# %config
# %doc
epilog
