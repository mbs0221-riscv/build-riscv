#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=attr
export VERSION=2.4.47
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://download.savannah.gnu.org/releases/attr/attr-2.4.47.src.tar.gz
export SOURCE=attr-2.4.47.src.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# # A helloworld program from the packagecloud.io blog!
# pre
pre
# pre
post
# pre
prep
# setup
setup
sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in &&
INSTALL_USER=root  \
INSTALL_GROUP=root \
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --disable-static
# build
build
make -j$(nproc)
# install
install
make install install-dev install-lib
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
