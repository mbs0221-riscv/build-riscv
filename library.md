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

