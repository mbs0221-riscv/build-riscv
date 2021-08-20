# build riscv-linux on rocketchip from scratch!
## Connect the Rocketchip to the Network Using UART
### Sifive UART
In `fpga/src/main/scala/vc709/Configs.scala`, we add following line
```
case PeripheryUARTKey => List(UARTParams(address = BigInt(0x64000000L), baudRate=921600, nTxEntries = 1024, nRxEntries = 1024))
```
### Sifive UART Driver
Then, we modify sifive uart driver
```
cd linux/
vim drivers/tty/serial/sifive.c
```
Then we modify following lines
```
#define SIFIVE_DEFAULT_BAUD_RATE                115200
#define SIFIVE_TX_FIFO_DEPTH                    8
#define SIFIVE_RX_FIFO_DEPTH                    8
```
and change above lines into following
```
#define SIFIVE_DEFAULT_BAUD_RATE                921600
#define SIFIVE_TX_FIFO_DEPTH                    1024
#define SIFIVE_RX_FIFO_DEPTH                    1024
```
### PPP Network
 > Device Drivers > Network device support
```
  │ │                                <*>   PPP (point-to-point protocol) support                                                            │ │  
  │ │                                < >     PPP BSD-Compress compression (NEW)                                                             │ │  
  │ │                                < >     PPP Deflate compression (NEW)                                                                  │ │  
  │ │                                [ ]     PPP filtering (NEW)                                                                            │ │  
  │ │                                < >     PPP MPPE compression (encryption) (NEW)                                                        │ │  
  │ │                                [*]     PPP multilink support                                                                          │ │  
  │ │                                < >     PPP over Ethernet (NEW)                                                                        │ │  
  │ │                                < >     PPP over IPv4 (PPTP) (NEW)                                                                     │ │  
  │ │                                <*>     PPP support for async serial ports                                                             │ │  
  │ │                                <*>     PPP support for sync tty ports                                                                 │ │  
  │ │                                <*>   SLIP (serial line) support                                                                       │ │  
  │ │                                [*]   CSLIP compressed headers                                                                         │ │  
```

```
sudo ./start-ppp.sh
```

### dropbear

### ntp-server
```
# build ntp and tzdb rpm packages
~/rpmbuild/SPECS$ ./run-spec.sh ntp-4.2.8p15.spec
~/rpmbuild/SPECS$ ./run-spec.sh tzdb-2021a.spec

# host side
$ sudo apt install -y ntp
$ service ntp-systemd-netif start
$ service ntp-systemd-netif status

# client side
$ cp /usr/share/zoneinfo/Asia/Shanghai $ROOTFS/etc/localtime
$ ntpdate $PEERNAME
```
### nfs-server
```
# host side
sudo apt install nfs-kernel-server nfs-common
sudo vim /etc/exports

  /nfsroot 10.0.5.2(rw,sync,no_wdelay,no_subtree_check,no_root_squash)
  /home/ubuntu 10.0.5.2(rw,sync,no_wdelay,no_subtree_check,no_root_squash)

sudo exportfs -rv
service nfs-kernel-server restart

# client side (/etc/ppp/ip-up)

NFS_ROOT=/mnt/nfs/root
NFS_HOME=/mnt/nfs/home

mount -t nfs -o nolock,rsize=65536,wsize=65536,tcp $IPREMOTE:/home/ubuntu $NFS_HOME
mount -t nfs -o nolock,rsize=65536,wsize=65536,tcp $IPREMOTE:/nfsroot     $NFS_ROOT
```

## build library and software
build rpm packages
* Install and configure rpmbuild
  ```
  sudo apt install -y rpm
  ```
* Modify `~/.rpmmacros`
  ```
  %_topdir    $HOME/rpmbuild
  ```
* Make directories
  ```
  mkdir -p ~/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
  ```
* Download tars
  ```
  wget -N -i packages.txt -P ~/rpmbuild/SOURCES/
  ```
* Build rpm packages
  ```
  ls ~/rpmbuild/RPMS/x86_64 | grep rpm | sed 's/-1.x86_64.rpm/.spec/;s/^/rpmbuild -ba /' > build-rpm.sh
  chmod +x build-rpm.sh
  cp -p build-rpm.sh ~/rpmbuild/SPECS
  cd ~/rpmbuild/SPECS
  ./build-rpm.sh
  ```
* Find failed to built rpm packages
  ```
  ./summary
  ```
* Convert rpm spec files into shell scripts
  ```
  ls ~/rpmbuild/SPECS/*.spec | xargs -i ./convert.sh {}
  ```

build library
```
# systemd
apt install intltool xmlto

# nfs-utils
./run-spec.sh libtirpc-1.3.2.spec
./run-spec.sh rpcbind-1.2.6.spec

# python 3.9
sudo apt install python3.9
./run-spec.sh Python-3.9.6.spec
./run-spec.sh libxml2-2.9.12.spec

# guile/
## bdw-gc for libunistring
cd gc-8.0.4
./configure --prefix=/usr
make -j$(nproc) && sudo make install

## libunistring for guile
sudo apt install libunistring-dev

## guile
cd guile-3.0.7
./configure --prefix=/usr
make -j12 && sudo make install

# gmp/mpfr/mpc
./run-spec.sh gmp-6.1.2.spec
./run-spec.sh mpfr-4.0.1.spec
./run-spec.sh mpc-1.1.0.spec

# readline/pcre2/libbytesize
./run-spec.sh readline-8.1.spec
./run-spec.sh pcre2-10.37.spec
./run-spec.sh libbytesize-2.6.spec

# GNU TLS
./run-spec.sh nettle-3.7.spec 
./run-spec.sh guile-3.0.7.spec
./run-spec.sh gnutls-3.1.5.spec

# The `libgpg-error-1.42` should be built before cross-compiling `scute`.
cd libgpg-error-1.42
./configure --prefix=/usr

make -j$(nproc) && sudo make install
```
Comment following line in `/etc/ImageMagick-6/policy.xml` to solve the security issue in building `scute`.
```
<policy domain="coder" rights="none" pattern="EPS" />
```

### rsync + inotify
```
# inotify-tools
sudo apt install inotify-tools

[root@vc709 ~]#uname -r
5.14.0-rc3
[root@vc709 ~]#ll /proc/sys/fs/inotify/*
-rw-r--r--    1 root     root             0 Jan  1 14:47 /proc/sys/fs/inotify/max_queued_events
-rw-r--r--    1 root     root             0 Jan  1 14:47 /proc/sys/fs/inotify/max_user_instances
-rw-r--r--    1 root     root             0 Jan  1 14:47 /proc/sys/fs/inotify/max_user_watches
[root@vc709 ~]#

# rsync
export USERNAME=ubuntu
export IPREMOTE=10.0.5.3

# sync rpm packages
rsync -azvP -e 'dbclient -y -p 2222' $USERNAME@$IPREMOTE:~/rpmbuild/RPMS /tmp/rpms

# sync libs
rsync -avzP -e 'dbclient -y -p 2222' $USERNAME@$IPREMOTE:~/sysroot/lib/            /lib/
rsync -avzP -e 'dbclient -y -p 2222' $USERNAME@$IPREMOTE:~/sysroot/usr/lib/        /usr/lib/

# sync rpm packages
rsync -avzP ~/rpmbuild/ -e ssh $USERNAME@IPREMOTE:~/rpmbuild/

# sync benchmarks
rsync -avzP -e ssh ubuntu@10.10.72.159:~/benchmark/riscv-coremark ~/benchmark/
rsync -avzP -e ssh ubuntu@10.10.72.159:~/benchmark/mibench ~/benchmark/

# backup benchmarks
rsync -avzp ~/benchmark/mibench/ --exclude=.git -e 'dbclient -y -p 2222' root@vc709:/tmp/benchmark/mibench/
rsync -avzP -e 'dbclient -y -p 2222' root@vc709:/tmp/benchmark/mibench/ ~/benchmark/mibench/
```

## Reference
* [Connecting to your Raspberry Pi Console via the Serial Cable](https://medium.com/@sarala.saraswati/connecting-to-your-raspberry-pi-console-via-the-serial-cable-44d7df95f03e)
* [Connect the Raspberry Pi to Network Using UART](https://www.instructables.com/Connect-the-Raspberry-Pi-to-network-using-UART/)
* [Establish PPP Network Connection on Raspberry Pi via Serial Console](https://docs.j7k6.org/raspberry-pi-ppp-network-serial-console/)
* [Chapter 29. Using PPP across a null modem (direct serial) connection](https://tldp.org/HOWTO/PPP-HOWTO/direct.html)
* [PPP Over UART](http://linuxkernel51.blogspot.com/2018/10/ppp-over-uart.html)
* [RPi Serial Connection](https://elinux.org/RPi_Serial_Connection#Virtual_connection_to_the_LAN)
* [树莓派通过串口接入网络](https://panqiincs.me/2020/08/15/rpi-network-via-serial/)
* [Dropbear SSH](https://matt.ucc.asn.au/dropbear/dropbear.html)
* [Building RPM packages with rpmbuild](https://blog.packagecloud.io/rpm/rpmbuild/packaging/2015/06/29/building-rpm-packages-with-rpmbuild/)


