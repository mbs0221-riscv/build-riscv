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
./setup-route.sh
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

## inotify-tools
```
sudo apt install inotify-tools
```

```
[root@vc709 ~]#uname -r
5.14.0-rc3
[root@vc709 ~]#ll /proc/sys/fs/inotify/*
-rw-r--r--    1 root     root             0 Jan  1 14:47 /proc/sys/fs/inotify/max_queued_events
-rw-r--r--    1 root     root             0 Jan  1 14:47 /proc/sys/fs/inotify/max_user_instances
-rw-r--r--    1 root     root             0 Jan  1 14:47 /proc/sys/fs/inotify/max_user_watches
[root@vc709 ~]#
```

## rsync
```
export USERREMOTE=ubuntu
export IPREMOTE=10.0.5.3

# sync rpm packages
rsync -azvpP -e 'dbclient -y -p 2222' $USERREMOTE@$IPREMOTE:~/rpmbuild/RPMS /var/www/rpms

# sync libs
rsync -azvpP -e 'dbclient -y -p 2222' $USERREMOTE@$IPREMOTE:~/sysroot/lib/            /lib/
rsync -azvpP -e 'dbclient -y -p 2222' $USERREMOTE@$IPREMOTE:~/sysroot/usr/lib/        /usr/lib/
rsync -azvpP -e 'dbclient -y -p 2222' $USERREMOTE@$IPREMOTE:~/sysroot/usr/local/lib/  /usr/local/lib/

# sync rpm packages
rsync -avzP ~/rpmbuild/ -e ssh ubuntu@IPREMOTE:~/rpmbuild/

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
* http://statusorel.ru/technology/connect-the-raspberry-pi-to-network-using-uart.html
* [Building RPM packages with rpmbuild](https://blog.packagecloud.io/rpm/rpmbuild/packaging/2015/06/29/building-rpm-packages-with-rpmbuild/)
