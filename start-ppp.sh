#!/bin/bash

source get-device.sh

echo =========dropbear====================
test -e /var/run/dropbear.pid || dropbear -E -R -p 2222 &
ps -ef | grep -E 'dropbear'

echo =========ppp:$dev====================
test -e /var/run/ppp0.pid || pppd $dev $(hostname):vc709 proxyarp passive

ps -ef | grep -E 'pppd'

echo =========ping:vc709==================
ping -c 5 vc709

if [ $? -eq 0 ]; then

	ifconfig -a ppp0 txqueuelen 1500
#	ifconfig -a ppp0 mtu 9000

	source setup-route.sh
	source check-nc.sh
fi
