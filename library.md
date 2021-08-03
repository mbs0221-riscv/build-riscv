# riscv-library
## pcap
http://www.us.tcpdump.org/release/
```
cd libpcap-1.9.1/
./configure --prefix=$SYSROOT/usr/local --host=riscv64-unknown-linux-gnu --target=riscv64-unknown-linux-gnu --with-pcap=linux 
./configure --prefix=$ROOTFS/usr/local --host=riscv64-unknown-linux-gnu --target=riscv64-unknown-linux-gnu --with-pcap=linux
make && make install
```

## ncurses
```
cd ncurses-6.2/
./configure --prefix=$SYSROOT/ --host=riscv64-unknown-linux-gnu --without-cxx --without-cxx-binding --without-ada --without-manpages --without-progs --without-tests --with-shared
make && make install
cd $SYSROOT/usr/lib
ln -s libncurses.so.6 libtinfo.so.6
ln -s libtinfo.so.6 libtinfo.so
```

## TinyXML-2
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

## libtirpc-1.3.2
https://www.linuxfromscratch.org/blfs/view/svn/basicnet/libtirpc.html
```
ubuntu@optiplex-5060:~/riscv-linux/library/libtirpc-1.3.2$ ./configure --prefix=$ROOTFS/usr --host=riscv64-unknown-linux-gnu --sysconfdir=$ROOTFS/etc --disable-gssapi --enable-shared 
make -j12 && make install
----------------------------------------------------------------------
Libraries have been installed in:
   /home/ubuntu/riscv-linux/rootfs/usr/lib

If you ever happen to want to link against installed libraries
in a given directory, LIBDIR, you must either use libtool, and
specify the full pathname of the library, or use the '-LLIBDIR'
flag during linking and do at least one of the following:
   - add LIBDIR to the 'LD_LIBRARY_PATH' environment variable
     during execution
   - add LIBDIR to the 'LD_RUN_PATH' environment variable
     during linking
   - use the '-Wl,-rpath -Wl,LIBDIR' linker flag
   - have your system administrator add LIBDIR to '/etc/ld.so.conf'

See any operating system documentation about shared libraries for
more information, such as the ld(1) and ld.so(8) manual pages.
----------------------------------------------------------------------
```

## sqlite3
```
cd sqlite-autoconf-3360000/
./configure --host=riscv64-unknown-linux-gnu --prefix=$SYSROOT/opt/sqlite3
make -j12 && make install

----------------------------------------------------------------------
Libraries have been installed in:
   /home/ubuntu/chipyard/riscv-tools-install/sysroot/opt/sqlite3/lib

If you ever happen to want to link against installed libraries
in a given directory, LIBDIR, you must either use libtool, and
specify the full pathname of the library, or use the '-LLIBDIR'
flag during linking and do at least one of the following:
   - add LIBDIR to the 'LD_LIBRARY_PATH' environment variable
     during execution
   - add LIBDIR to the 'LD_RUN_PATH' environment variable
     during linking
   - use the '-Wl,-rpath -Wl,LIBDIR' linker flag
   - have your system administrator add LIBDIR to '/etc/ld.so.conf'

See any operating system documentation about shared libraries for
more information, such as the ld(1) and ld.so(8) manual pages.
----------------------------------------------------------------------
```
