#!/bin/bash

echo =====================================
dev=/dev/$(dmesg | grep "cp210x converter now attached to" | tail -n 1 | sed 's/.*to //g')
echo Device: $dev

