#!/bin/bash

echo =========Setup Routing and NAT=======

#modprobe -r ip_tables
iptables -F
#iptables -X
#iptables -Z
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

ifconfig -a ppp0 txqueuelen 1500
ifconfig -a ppp0

# Step 7: Setup Routing and NAT

# Once we've established an IP link between our computer and the Raspberry Pi, we can
# configure the computer to route traffic from the Raspi to the Internet. First, enable
# the traffic forwarding:

sysctl -w net.ipv4.ip_forward=1

# Next, enable the NAT masquerade to translate Raspi's internal address to the computer's
# address. Assuming the 'eth0' is an interface on your computer that you use to connect
# to the outside world:

ifconfig -a eno1
if [ $? -eq 0 ]; then
	ip_addr=$(ifconfig -a eno1 | grep 'inet ' | awk '{print $2}')
	echo eno1: $ip_addr
	
	if [ $ip_addr ]; then
		#iptables -t nat -A POSTROUTING -o eno1 -j MASQUERADE
		iptables -t nat -A POSTROUTING -o eno1 -s 10.0.5.2 -j SNAT --to $ip_addr
		echo "Now, you should be able to ssh to the Raspberry and ping some internet server :-)"
	fi
fi

ifconfig -a wlo1
if [ $? -eq 0 ]; then
	ip_addr=$(ifconfig -a wlo1 | grep 'inet ' | awk '{print $2}')
	echo wlo1: $ip_addr

	if [ $ip_addr ]; then
		#iptables -t nat -A POSTROUTING -o wlo1 -j MASQUERADE
		iptables -t nat -A POSTROUTING -o wlo1 -s 10.0.5.2 -j SNAT --to $ip_addr
        	echo "Now, you should be able to ssh to the Raspberry and ping some internet server :-)"
	fi
fi

ifconfig -a enp3s0
if [ $? -eq 0 ]; then
	ip_addr=$(ifconfig -a enp3s0 | grep 'inet ' | awk '{print $2}')
	echo enp3s0: $ip_addr

	if [ $ip_addr ]; then
		#iptables -t nat -A POSTROUTING -o enp3s0 -j MASQUERADE
	        iptables -t nat -A POSTROUTING -o enp3s0 -s 10.0.5.2 -j SNAT --to $ip_addr
        	echo "Now, you should be able to ssh to the Raspberry and ping some internet server :-)"
	fi
fi
