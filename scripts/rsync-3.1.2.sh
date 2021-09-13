#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=rsync
export VERSION=3.1.2
# Release:        1%{?dist}
# Group:          Network
# Summary:        The rsync package contains the rsync utility. This is useful for synchronizing large file archives over a network.
# License:        GPLv3+
export URL=https://www.samba.org/ftp/rsync/src/rsync-3.1.2.tar.gz
export SOURCE=rsync-3.1.2.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# rsync is a replacement for rcp (and scp) that has many more features. It uses the “rsync algorithm” which provides a very fast method of syncing remote files. It does this by sending just the differences in the files across the link, without requiring that both sets of files are present at one end of the link beforehand.
# pre
pre
# pre
prep
# setup
setup
sudo apt install doxygen
./configure --prefix=$BUILDROOT/usr \
            --host=riscv64-unknown-linux-gnu &&
# build
build
make -j$(nproc)
# install
install
make install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
epilog
