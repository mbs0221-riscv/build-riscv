#!/bin/bash

source stop-pppd.sh
source get-device.sh

echo =========ppp:$dev====================
pppd $dev $(hostname):vc709 proxyarp passive # netmask 255.255.255.0

echo =========process status==============
ps -ef | grep -E 'dropbear|pppd'

echo =========ping:vc709==================
ping -c 5 vc709

if [ $? -eq 0 ]; then
	ifconfig -a ppp0 txqueuelen 1000

#	source setup-ufw.sh
	source setup-route.sh
	
	killall dropbear
	dropbear -E -R -p 2222 &

  	echo =========/nfsroot/vc709.log==========
      	tail -n 16 /nfsroot/vc709.log
	
      	echo =========ports:======================
      	nc -zv 10.0.5.2 2222
      	nc -zv 10.0.5.2 22
      	nc -zv 10.0.5.2 21
fi
