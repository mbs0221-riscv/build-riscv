# riscv-library
## pcap [OK]
http://www.us.tcpdump.org/release/
```
cd libpcap-1.9.1/
./configure --prefix=$SYSROOT/usr/local --host=riscv64-unknown-linux-gnu --target=riscv64-unknown-linux-gnu --with-pcap=linux 
./configure --prefix=$ROOTFS/usr/local --host=riscv64-unknown-linux-gnu --target=riscv64-unknown-linux-gnu --with-pcap=linux
make && make install
```

## ncurses [OK]
```
wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.2.tar.gz
tar -xvf ncurses-6.2.tar.gz
cd ncurses-6.2/

./configure --prefix=$SYSROOT/ --host=riscv64-unknown-linux-gnu --without-cxx --without-cxx-binding --without-ada --without-manpages --without-progs --without-tests --with-shared
make -j8 && make install
cd $SYSROOT/lib
ln -s libncurses.so.6 libtinfo.so.6
ln -s libtinfo.so.6 libtinfo.so

./configure --prefix=$(pwd)/build --host=riscv64-unknown-linux-gnu --without-cxx --without-cxx-binding --without-ada --without-manpages --without-progs --without-tests --with-shared
make -j8 && make install
```

## TinyXML-2 [OK]
```
git clone https://github.com/leethomason/tinyxml2.git
cd tinyxml2
mkdir build && cd build
CC=riscv64-unknown-linux-gnu-gcc CXX=riscv64-unknown-linux-gnu-g++ cmake -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr/local ../
CC=riscv64-unknown-linux-gnu-gcc CXX=riscv64-unknown-linux-gnu-g++ cmake -DCMAKE_INSTALL_PREFIX=$ROOTFS/usr/local ../
make && make install
```

## mbedtls
```
wget --no-check-certificate https://github.com/ARMmbed/mbedtls/archive/refs/tags/v3.0.0.tar.gz
tar -xvf v3.0.0.tar.gz
cd mbedtls-3.0.0/
CC=riscv64-unknown-linux-gnu-gcc cmake -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr/local -DUSE_SHARED_MBEDTLS_LIBRARY=On ../
make && make install
```

## linux-pam
```
git clone https://github.com/linux-pam/linux-pam.git
cd linux-pam/
git checkout v1.5.1
```

## libtirpc-1.3.2 [OK]
https://www.linuxfromscratch.org/blfs/view/svn/basicnet/libtirpc.html
```
wget https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.2.tar.bz2
tar -xvf libtirpc-1.3.2.tar.bz2
cd libtirpc-1.3.2

./configure --prefix=$SYSROOT/usr                          \
            --host=riscv64-unknown-linux-gnu               \
            --sysconfdir=$SYSROOT/etc                      \
            --disable-gssapi --enable-shared               &&
make -j12 && make install

export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
```

## rpcsvc-proto-1.4.2 [OK]
https://www.linuxfromscratch.org/blfs/view/svn/basicnet/rpcsvc-proto.html
```
wget https://github.com/thkukuk/rpcsvc-proto/releases/download/v1.4.2/rpcsvc-proto-1.4.2.tar.xz
tar -xvf rpcsvc-proto-1.4.2.tar.xz
cd rpcsvc-proto-1.4.2

./configure --prefix=$SYSROOT/usr                          \
            --host=riscv64-unknown-linux-gnu               \
            --sysconfdir=$SYSROOT/etc                      &&
make -j8 && make install

../rpcgen/rpcgen -h -o klm_prot.h klm_prot.x
../rpcgen/rpcgen -h -o nlm_prot.h nlm_prot.x
../rpcgen/rpcgen -h -o rstat.h rstat.x
../rpcgen/rpcgen -h -o spray.h spray.x
../rpcgen/rpcgen -h -o bootparam_prot.h bootparam_prot.x
../rpcgen/rpcgen -h -o mount.h mount.x
../rpcgen/rpcgen -h -o rex.h rex.x
../rpcgen/rpcgen -h -o rusers.h rusers.x
```

## rpcbind-1.2.6 [OK]
https://www.linuxfromscratch.org/blfs/view/svn/basicnet/rpcbind.html
```
wget https://downloads.sourceforge.net/rpcbind/rpcbind-1.2.6.tar.bz2
wget https://www.linuxfromscratch.org/patches/blfs/svn/rpcbind-1.2.6-vulnerability_fixes-1.patch
tar -xvf rpcbind-1.2.6.tar.bz2
cd rpcbind-1.2.6

sed -i "/servname/s:rpcbind:sunrpc:" src/rpcbind.c
patch -Np1 -i ../rpcbind-1.2.6-vulnerability_fixes-1.patch &&

export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH

./configure --prefix=$SYSROOT/usr                          \
            --host=riscv64-unknown-linux-gnu               \
            --bindir=$SYSROOT/usr/sbin                     \
            --with-rpcuser=root                            \
            --enable-warmstarts                            \
            --with-systemdsystemunitdir=no                 &&
make -j8 && make install
```

## libuuid-1.0.3 [OK]
```
wget https://sourceforge.net/projects/libuuid/files/libuuid-1.0.3.tar.gz
tar -xvf libuuid-1.0.3.tar.gz
cd libuuid-1.0.3

./configure --prefix=$SYSROOT/usr/local                    \
            --host=riscv64-unknown-linux-gnu               &&
make -j8 && make install

export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
```

## libevent [OK]
https://www.linuxfromscratch.org/blfs/view/svn/basicnet/libevent.html
```
wget https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz
tar -xvf libevent-2.1.12-stable.tar.gz
cd libevent-2.1.12-stable

sed -i 's/python/&3/' event_rpcgen.py

./configure --prefix=$SYSROOT/usr                          \
            --host=riscv64-unknown-linux-gnu               \
            --enable-shared &&
make -j8 && make install

export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH

```

## sqlite3 [OK]
```
wget https://www.sqlite.org/2021/sqlite-autoconf-3360000.tar.gz
tar -xvf sqlite-autoconf-3360000.tar.gz
cd sqlite-autoconf-3360000/

./configure --host=riscv64-unknown-linux-gnu --prefix=$SYSROOT/opt/sqlite3
make -j12 && make install

export PKG_CONFIG_PATH=$SYSROOT/opt/sqlite3/lib/pkgconfig:$PKG_CONFIG_PATH
```
