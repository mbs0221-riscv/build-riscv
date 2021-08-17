# build riscv-linux on rocketchip from scratch!
## Connect the Rocketchip to the Network Using UART
### Step 0: modify uart parameters
In `fpga/src/main/scala/vc709/Configs.scala`, we add following line
```
case PeripheryUARTKey => List(UARTParams(address = BigInt(0x64000000L), baudRate=921600, nTxEntries = 1024, nRxEntries = 1024))
```

### Step 1: modify sifive uart driver.
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
### Step 2: pppd
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

# route
sysctl -w net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o eno0 -j MASQUERADE
```

### Step 3: dropbear
[Dropbear SSH](https://matt.ucc.asn.au/dropbear/dropbear.html)
```
# host side
./configure --prefix=/usr --with-zlib=/home/kiki212/software/zlib-1.2.11/build
sudo make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" install
```

The `libnss` is also needed for dropbear to work, and can be found in the `SYSROOT`.

### Step 4: ntp-server
```
# local timezone
cp /usr/share/zoneinfo/Asia/Shanghai $ROOTFS/etc/localtime

# host side
sudo apt install ntp -y
service ntp-systemd-netif start
service ntp-systemd-netif status
```

## build library and software
### building rpm packages from source code
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

# build rpm packages
ls ~/rpmbuild/RPMS/x86_64 | grep rpm | sed 's/-1.x86_64.rpm/.spec/;s/^/rpmbuild -ba /' > build-rpm.sh
chmod +x build-rpm.sh
cp -p build-rpm.sh ~/rpmbuild/SPECS

cd ~/rpmbuild/SPECS
./build-rpm.sh
```

Find failed to built rpm packages
```
find ~/rpmbuild/SPECS/*.spec | sed "s/.*\///;s/.spec//" > ~/rpmbuild/SPECS/spec.list
find ~/rpmbuild/RPMS/x86_64/*.rpm | sed "s/.*\///;s/-1.x86_64.rpm\|-stable.x86\_64.rpm//" > ~/rpmbuild/RPMS/x86_64/rpm.list
find ~/rpmbuild/SOURCES/*.tar.* | sed "s/.*\///;s/.tar//;s/.gz\|.sz\|.lz\|.xz\|.bz2//" > ~/rpmbuild/SOURCES/sources.list
echo ================has no spec files===========================
grep -F -v -f ~/rpmbuild/SPECS/spec.list ~/rpmbuild/SOURCES/sources.list | sort | uniq
echo ================build failed================================
grep -F -v -f ~/rpmbuild/RPMS/x86_64/rpm.list ~/rpmbuild/SPECS/spec.list | sort | uniq
```

Convert rpm spec files into shell scripts
```
ls ~/rpmbuild/SPECS/*.spec | xargs -i ./convert.sh {}
```

### systemd
```
# systemd
apt install intltool xmlto
```

## build library and software
```
#
./run-spec.sh libpcap-1.9.1.spec

# nfs-utils
./run-spec.sh libtirpc-1.3.2.spec
./run-spec.sh rpcbind-1.2.6.spec


# libcap
./run-spec.sh libcap-2.48.spec
./run-spec.sh libevent-2.1.12-stable.spec

# asm
./run-spec.sh nasm-2.15.05.spec
./run-spec.sh yasm-1.3.0.spec

# compress
./run-spec.sh gzip-1.10.spec
./run-spec.sh lzo-2.10.spec
./run-spec.sh xz-5.2.3.spec
./run-spec.sh xz-5.2.5.spec
./run-spec.sh zlib-1.2.11.spec
./run-spec.sh zstd-1.4.8.spec

# database
./run-spec.sh sqlite-autoconf-3360000.spec
./run-spec.sh memcached-1.6.9.spec
./run-spec.sh redis-6.2.5.spec

./run-spec.sh gdbm-1.19.spec
./run-spec.sh gdbm-1.20.spec

# attr/acl
./run-spec.sh attr-2.4.47.spec
./run-spec.sh acl-2.2.52.spec

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

# date/time
sudo apt install lzip
./run-spec.sh tzdb-2021a.spec
./run-spec.sh openssl-1.1.1k.spec

# rsync
sudo apt install doxygen
./run-spec.sh popt-1.18.spec
./run-spec.sh rsync-3.1.2.spec

# gmp/mpfr/mpc
./run-spec.sh gmp-6.1.2.spec
./run-spec.sh mpfr-4.0.1.spec
./run-spec.sh mpc-1.1.0.spec

# readline/pcre2/libbytesize
./run-spec.sh readline-8.1.spec
./run-spec.sh pcre2-10.37.spec
./run-spec.sh libbytesize-2.6.spec

# GnuPG: https://www.gnupg.org/download/
./run-spec.sh libgpg-error-1.42.spec
./run-spec.sh libgcrypt-1.8.8.spec
./run-spec.sh libksba-1.6.0.spec
./run-spec.sh libassuan-2.5.5.spec
./run-spec.sh ntbtls-0.2.0.spec
./run-spec.sh npth-1.6.spec
./run-spec.sh gpgme-1.16.0.spec
./run-spec.sh gpa-0.10.0.spec [gtk+-2.0]
./run-spec.sh scute-1.7.0.spec
```

The `libgpg-error-1.42` should be built before cross-compiling `scute`.
```
cd libgpg-error-1.42
./configure --prefix=/usr
make -j$(nproc) && sudo make install
```

Comment out following lines in `/etc/ImageMagick-6/policy.xml` to solve the security issue in building `scute`.
```
  <policy domain="coder" rights="none" pattern="EPS" />
```

## rsync
```
export USERREMOTE=ubuntu
export IPREMOTE=10.0.5.3

# sync rpm packages
rsync -azvpP -e 'dbclient -y -p 2222' $USERREMOTE@$IPREMOTE:~/rpmbuild/RPMS /var/www/rpms

# sync libs
rsync -azvpP -e 'dbclient -y -p 2222' $USERREMOTE@$IPREMOTE:~/sysroot/lib/            /lib
rsync -azvpP -e 'dbclient -y -p 2222' $USERREMOTE@$IPREMOTE:~/sysroot/usr/lib/        /usr/lib
rsync -azvpP -e 'dbclient -y -p 2222' $USERREMOTE@$IPREMOTE:~/sysroot/usr/local/lib/  /usr/local/lib

# sync rpm packages
rsync -avzP ~/rpmbuild/ -e ssh ubuntu@IPREMOTE:~/rpmbuild/

# sync benchmarks
rsync -avzP -e ssh $USERREMOTE@$IPREMOTE:~/benchmark/mibench ~/benchmark/
```

## nghttpd
install following packags to run nghttpd
```
rpm -i c-ares-1.17.2-1.x86_64.rpm
rpm -i jansson-2.13-1.x86_64.rpm
rpm -i jemalloc-5.2.1-1.x86_64.rpm
rpm -i libev-4.33-1.x86_64.rpm
rpm -i libxml2-2.9.12-1.x86_64.rpm
rpm -i nghttp2-1.44.0-1.x86_64.rpm
```

## Reference
* [Connecting to your Raspberry Pi Console via the Serial Cable](https://medium.com/@sarala.saraswati/connecting-to-your-raspberry-pi-console-via-the-serial-cable-44d7df95f03e)
* [Connect the Raspberry Pi to Network Using UART](https://www.instructables.com/Connect-the-Raspberry-Pi-to-network-using-UART/)
* [Establish PPP Network Connection on Raspberry Pi via Serial Console](https://docs.j7k6.org/raspberry-pi-ppp-network-serial-console/)
* http://statusorel.ru/technology/connect-the-raspberry-pi-to-network-using-uart.html
* [Building RPM packages with rpmbuild](https://blog.packagecloud.io/rpm/rpmbuild/packaging/2015/06/29/building-rpm-packages-with-rpmbuild/)
