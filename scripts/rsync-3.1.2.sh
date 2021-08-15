#!/bin/bash
source ../build-utils.sh
export NAME=rsync
export VERSION=3.1.2
# Release:        1#{?dist}
# # Summary:        The rsync package contains the rsync utility. This is useful for synchronizing large file archives over a network.
# License:        GPLv3+
export URL=https://www.samba.org/ftp/rsync/src/rsync-3.1.2.tar.gz
export SOURCE=rsync-3.1.2.tar.gz
# Requires(post): info
# Requires(preun): info
#description
# rsync is a replacement for rcp (and scp) that has many more features. It uses the “rsync algorithm” which provides a very fast method of syncing remote files. It does this by sending just the differences in the files across the link, without requiring that both sets of files are present at one end of the link beforehand.
#pre
#prep
setup
sudo apt install doxygen
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu &&
#build
#build
build
make -j$(nproc)
#install
install
make install
#clean

#files
#defattr(-,root,root,-)
epilog
