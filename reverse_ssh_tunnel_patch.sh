#!/bin/sh
SERVER_IP=10.0.5.1
PORT=2221
USER=userA
dropbear -i /etc/dropbear/dropbear_rsa_host_key -y -N -f -R ${PORT}:localhost:2222 ${USER}@${SERVER_IP}
iptables -I INPUT -i lo -p tcp -m tcp --dport 2222 -j ACCEPT
