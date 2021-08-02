#!/bin/sh

# load all kernel modules
echo "Loading kernel module"
depmod
modules=$(find /lib/modules/$(uname -r)/kernel/ -name *.ko | sed 's/.*\///g;s/.ko//g' | xargs)
for module in $modules; do
  modprobe $module
done

