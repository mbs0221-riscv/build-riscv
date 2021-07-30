#!/bin/bash

cd $SYSROOT
files=$(find ./ -name libnss_*)
for file in $files; do
    echo file: $file
    cp -d -p --parents $file /nfsroot
    cp -d -p --parents $file $ROOTFS
done

