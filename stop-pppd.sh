#!/bin/bash

echo =====================================
echo stop old pppd...
ps -ef | grep -E 'pppd|SCREEN' | awk '{print $2}' | uniq | xargs kill -SIGKILL

