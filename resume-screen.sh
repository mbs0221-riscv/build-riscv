#!/bin/bash

screen_id=$(screen -ls | grep vc709 | head -1 | sed 's/.vc709.*//g')
screen -r $screen_id
