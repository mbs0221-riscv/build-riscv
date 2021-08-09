#!/bin/bash

#cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
#cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys

#host
/usr/local/sbin/dropbear -E -R -p 2222

ssh -Nfg -R 11111:10.0.5.2:2222 kiki212@192.168.0.102
