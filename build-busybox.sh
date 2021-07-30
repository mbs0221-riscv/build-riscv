#!/bin/bash

cd busybox

make menuconfig
make ARCH=rv64imafdc
make install

cd ..
cp -r busybox/_install/* ./rootfs/
