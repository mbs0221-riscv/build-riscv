# Connect the Rocketchip to the Network Using UART
## Step -2: modify uart parameters
In `fpga/src/main/scala/vc709/Configs.scala`, we add following line
```
case PeripheryUARTKey => List(UARTParams(address = BigInt(0x64000000L), baudRate=921600, nTxEntries = 1024, nRxEntries = 1024))
```

## Step -1: modify sifive uart driver.
```
cd linux/
vim drivers/tty/serial/sifive.c

# Then we modify following lines

#define SIFIVE_DEFAULT_BAUD_RATE                115200
#define SIFIVE_TX_FIFO_DEPTH                    8
#define SIFIVE_RX_FIFO_DEPTH                    8

# and change above lines at following

#define SIFIVE_DEFAULT_BAUD_RATE                921600
#define SIFIVE_TX_FIFO_DEPTH                    1024
#define SIFIVE_RX_FIFO_DEPTH                    1024
```

## Step 0: setup environment variables
```
export RISCV=/path/to/riscv-toolchain
export SYSROOT=$RISCV/sysroot
export ROOTFS=/path/to/rootfs

```
## Step 1: pppd
```
# host side
./configure
make -j12 && make install

# route
sysctl -w net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o eno0 -j MASQUERADE
```

## Step 2: dropbear
[Dropbear SSH](https://matt.ucc.asn.au/dropbear/dropbear.html)
```
# host side
./configure --prefix=/usr --with-zlib=/home/kiki212/software/zlib-1.2.11/build
sudo make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" install
```

The `libnss` is also needed for dropbear to work, and can be found in the `SYSROOT`.

## ntp-server
```
# local timezone
cp /usr/share/zoneinfo/Asia/Shanghai $ROOTFS/etc/localtime

# host side
sudo apt –y install ntp 
service ntp-systemd-netif start
service ntp-systemd-netif status
```

## Step 3: build library and software
```
# download compressed packages
wget -N -i packages.txt -P ~/rpmbuild/SOURCES/

# install and configure rpmbuild
sudo apt install rpm
vim ~/.rpmmacros

%_topdir    $HOME/rpmbuild

# mkdirs
mkdir -p ~/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}

# git clone
cd ~/rpmbuild/SOURCES
git clone https://github.com/leethomason/tinyxml2.git && tar -czvf tinyxml2.tar.gz tinyxml2

# rpmbuild packages
cd ~/rpmbuild/SPECS

# helloworld
rpmbuild -ba helloworld.spec

# library
rpmbuild -ba libpcap-1.9.1.spec
rpmbuild -ba libuuid-1.0.3.spec
rpmbuild -ba ncurses-6.2.spec
rpmbuild -ba libnfsidmap-0.25.spec
rpmbuild -ba json-c-0.15.spec
# sudo apt install gperf [lcov]
rpmbuild -bc gperf-3.1.spec
rpmbuild -ba libseccomp-2.5.1.spec

# sqlite
rpmbuild -ba sqlite-autoconf-3360000.spec

# openssh
rpmbuild -ba zlib-1.2.11.spec
rpmbuild -ba openssl-1.1.1k.spec
rpmbuild -ba openssh-8.6p1.spec

# module-init-tools
sudo apt install docbook-utils docbook-to-man
rpmbuild -ba module-init-tools-3.15.spec

# network
rpmbuild -ba dropbear-2020.81.spec
rpmbuild -ba ppp-2.4.9.spec
rpmbuild -ba vsftpd-3.0.4.spec

# RPC
rpmbuild -ba rpcbind-1.2.6.spec
rpmbuild -ba libtirpc-1.3.2.spec

# utils 
rpmbuild -ba bash-5.1.8.spec
rpmbuild -ba htop-2.2.0.spec
rpmbuild -ba ntp-4.2.8p15.spec
rpmbuild -ba gperf-3.1.spec

# benchmark
rpmbuild -ba mbedtls-3.0.0.spec
rpmbuild -ba liblinear-243.spec

# [failed]
rpmbuild -ba libevent-2.1.12-stable.spec
rpmbuild -ba rpcsvc-proto-1.4.2.spec

# [problematic]
rpmbuild -ba lrzsz-0.12.20.spec
rpmbuild -ba nfs-utils-2.5.3.spec
```

## Reference
* [Connecting to your Raspberry Pi Console via the Serial Cable](https://medium.com/@sarala.saraswati/connecting-to-your-raspberry-pi-console-via-the-serial-cable-44d7df95f03e)
* [Connect the Raspberry Pi to Network Using UART](https://www.instructables.com/Connect-the-Raspberry-Pi-to-network-using-UART/)
* [Establish PPP Network Connection on Raspberry Pi via Serial Console](https://docs.j7k6.org/raspberry-pi-ppp-network-serial-console/)
* http://statusorel.ru/technology/connect-the-raspberry-pi-to-network-using-uart.html
* [Building RPM packages with rpmbuild](https://blog.packagecloud.io/rpm/rpmbuild/packaging/2015/06/29/building-rpm-packages-with-rpmbuild/)
