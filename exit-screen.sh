#!/bin/bash

str=$(screen -ls)
last=$(echo $str|tr "." "\n")

for v in $list
do
  if [ $v -gt 0 ]; then
    screen -S $v -X quit
  fi
done

