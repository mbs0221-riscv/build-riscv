#!/bin/bash

readelf=riscv64-unknown-linux-gnu-readelf
log="$(pwd)/a.log"

function find_dependency(){
  for path in $(ls $1); do
    if test -f $1/$path; then
      lines=$(readelf -d $1/$path | grep 'Shared library:' | awk '{print $5}' | sed 's/\(\[\|\]\)//g')
      for line in $lines; do
        if [ $line ]; then
          echo $line >> $log
        fi
      done
    fi
  done
}

path="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"

for path in $(echo $path | sed 's/:/ /g'); do
  find_dependency $(pwd)$path
done
libs=$(cat $log | sort | uniq)

TARGET=$ROOTFS
cd $RISCV/sysroot/
for lib in $libs; do
  path=$(find ./ -name $lib)
  if [ -x $path ]; then
    echo ok: $path
    cp -P -d -p --parents $path $TARGET
  else
    echo failed: $path
  fi
done
