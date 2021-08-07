# riscv-library
http://www.us.tcpdump.org/release/

## TinyXML-2 [OK]
```
git clone https://github.com/leethomason/tinyxml2.git
cd tinyxml2

mkdir build && cd build
CC=riscv64-unknown-linux-gnu-gcc CXX=riscv64-unknown-linux-gnu-g++ cmake -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr/local ../
CC=riscv64-unknown-linux-gnu-gcc CXX=riscv64-unknown-linux-gnu-g++ cmake -DCMAKE_INSTALL_PREFIX=$ROOTFS/usr/local ../
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
