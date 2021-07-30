Setup RaspberryPi:
mkdir -p /etc/ppp/scripts

cat > /etc/ppp/scripts/ppplogin <<EOF
#!/bin/sh

# ppplogin - script to fire up pppd on login

# Disable other users to write to the tty.
mesg n

# Turn off character echoing.
stty -echo

exec /usr/bin/sudo /usr/sbin/pppd debug nodetach noauth silent local nocrtscts xonxoff maxfail 0 proxyarp
EOF

# Add ppp user to system
useradd --system --groups dip --no-create-home --no-user-group --password ppp --shell /etc/ppp/scripts/ppplogin ppp

# Allow ppp user to run pppd with root privileges for noauth
echo "ppp ALL=(ALL) NOPASSWD: /usr/sbin/pppd" >> /etc/sudoers

cat > /etc/ppp/ip-up.d/ppp <<EOF

#!/bin/sh

ip route add 192.168.1.0/24 dev $PPP_IFACE
ip route add default via 192.168.1.1
echo "nameserver 192.168.1.1" > /etc/resolv.conf 

EOF


??????, ??? ?????? ???? ???????? ???????:

passwd ppp

Edit
Setup Debian/Ubuntu

cat > /etc/ppp/peers/pi <<EOF
# Serial device to which the modem is connected.
/dev/ttyUSB0

# Speed of the serial line.
115200

connect "/usr/sbin/chat -v -f /etc/chatscripts/pi" 

noauth
local
nocrtscts
xonxoff
noipdefault
nodefaultroute
maxfail 0
persist
192.168.1.42:192.168.1.41
EOF

cat > /etc/chatscripts/pi <<EOF

TIMEOUT     3
ogin:--ogin: ppp
ssword: \qppp

EOF

cat >> /etc/network/interfaces <<EOF

# auto pi
iface pi inet ppp
    provider pi

EOF

# Setup connection
ifup pi

