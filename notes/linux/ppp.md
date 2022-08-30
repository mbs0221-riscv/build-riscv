# PPP Network
Connect the Rocketchip to the Network Using UART
## PPP Configuration
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

CONFIG_DEVTMPFS_MOUNT=y
```
# codepage cp437 not found
File systems >
  Native language support >
<*>   Codepage 437 (United States, Canada)

# Unable to load NLS charset iso8859-1
File systems >
  Native language support >
<*>   NLS ISO 8859-1  (Latin 1; Western European Languages)
```
```
modprobe tun
modprobe ppp-compress-18
modprobe ppp_mppe
modprobe ppp_deflate
modprobe ppp_async
modprobe pppoatm
modprobe ppp_generic
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
Then we build dropbear and ppp rpm package
```
# build rpm package
~/rpmbuild/SPECS$ ./run-spec.sh ppp-2.4.9.spec
~/rpmbuild/SPECS$ ./run-spec.sh dropbear-2020.81.spec
~/rpmbuild/SPECS$ ./run-spec.sh rsync-3.1.2.spec

# start host-side ppp service
sudo ./start-ppp.sh
```

## USB Network
> General setup > Initial RAM filesystem and RAM disk

> Device Drivers > Block devices > RAM block device support

> Device Drivers > USB support > USB Gadget Support > USB Gadget precomposed configurations > <M> Ethernet Gadget (with CDC Ethernet support)

setup environment variables
```
export RISCV=/path/to/riscv-toolchain
export SYSROOT=$RISCV/sysroot
export ROOTFS=/path/to/rootfs
```

```
# minimal dependency
[ok] libpcap.so.1.9.1 required by ppp
[ok] libssl.so.1.1 required by 
[ok] libncurses.so.6.2 required by busybox
[  ] libz.so.1.2.8
[  ] libm-2.29.so

# host side
./configure
make -j12 && make install
```

```
# host side
./configure --prefix=/usr --with-zlib=/home/kiki212/software/zlib-1.2.11/build
sudo make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" install
```

The `libnss` is also needed for dropbear to work, and can be found in the `SYSROOT`.

```
# ===========================================================
# normal user
test $(id -u kiki) || \
        echo -e "kimi950221\nkimi950221" | adduser -h /home/kiki -g 'kiki' -s /bin/sh kiki

test $(id -u kimi) || \
        echo -e "kiki950221\nkiki950221" | adduser -h /home/kimi -g 'kimi' -s /bin/sh kimi

# ftp user
test -d /usr/share/empty || mkdir -p /usr/share/empty
test -d /var/ftp || mkdir -p /var/ftp && \
        chown root:root /var/ftp &&\ 
        chmod og-w /var/ftp

test $(id -u nobody) || \
        adduser -s /usr/sbin/nologin -D -H nobody

test $(id -u ftp) || \
        adduser -h /var/ftp -D -H ftp 

# rsyncd user
test $(id -u rsyncd) || \
        addgroup -g 48 rsyncd && \
        adduser -h /home/rsync -g "rsyncd Daemon" -s /bin/false -G rsyncd -D -u 48 rsyncd
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