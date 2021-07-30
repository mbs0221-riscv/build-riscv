#!/bin/bash

# Step 7: Setup Routing and NAT

# Once we've established an IP link between our computer and the Raspberry Pi, we can
# configure the computer to route traffic from the Raspi to the Internet. First, enable
# the traffic forwarding:
sudo sysctl -w net.ipv4.ip_forward=1

# Next, enable the NAT masquerade to translate Raspi's internal address to the computer's
# address. Assuming the 'eth0' is an interface on your computer that you use to connect
# to the outside world:
sudo iptables -t nat -A POSTROUTING -o eno1 -j MASQUERADE

# Now, you should be able to ssh to the Raspberry and ping some internet server :-)
ssh root@10.0.5.2
