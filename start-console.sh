#!/bin/bash

dev=$(dmesg | grep "cp210x converter now attached to ttyUSB[0-9]" | sed -s "s/.* attached to /\/dev\//g" | sed -n '$p')

echo Device: $dev

screen -S vc709 -L $dev 115200
