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
	echo =========Setup Routing and NAT=======
      	sysctl -w net.ipv4.ip_forward=1
      	if [ ifconfig -a eno1 ]; then
		iptables -t nat -A POSTROUTING -o eno1 -j MASQUERADE
    	fi
    	if [ ifconfig -a wlo1 ]; then
		iptables -t nat -A POSTROUTING -o wlo1 -j MASQUERADE
	fi
	if [ ifconfig -a enp3s0 ]; then
	    	iptables -t nat -A POSTROUTING -o enp3s0 -j MASQUERADE
      	fi

  	echo =========/nfsroot/vc709.log==========
      	tail -n 16 /nfsroot/vc709.log
	
      	echo =========ports:======================
      	nc -zv 10.0.5.2 2222
      	nc -zv 10.0.5.2 22
      	nc -zv 10.0.5.2 21
fi
