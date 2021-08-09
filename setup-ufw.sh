#!/bin/bash

iptables -F
iptables -L

ufw allow proto tcp from 10.0.5.2 to any port 22
ufw allow proto tcp from 10.0.5.2 to any port 2222
ufw allow proto tcp from 10.0.5.2 to any port 21
ufw allow proto tcp from 10.0.5.2 to any port 80
ufw allow proto tcp from 10.0.5.2 to any port 8889
ufw allow proto tcp from 10.0.5.2 to any port 1089
ufw allow proto tcp from 10.0.5.2 to any port 2049

ufw allow from 10.0.5.2 to any port nfs

ufw enable
ufw status
