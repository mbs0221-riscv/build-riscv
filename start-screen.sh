#!/bin/bash

source get-device.sh

echo start screen on $dev
screen -S vc709 -L $dev 921600
