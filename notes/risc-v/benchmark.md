# Benchmark
```
ls -lh $ROOTFS/home/ubuntu/
```
## riscv-coremark
```
cd riscv-coremark
git submodule update --init
./build-coremark.sh
cp coremark.riscv $ROOTFS/home/ubuntu/

[root@vc709 riscv-coremark]#./coremark.riscv
remark.riscv
2K performance run parameters for coremark.
CoreMark Size    : 666
Total ticks      : 17061395070
Total time (secs): 17.061395
Iterations/Sec   : 1758.355625
Iterations       : 30000
Compiler version : GCC9.2.0
Compiler flags   : -O2   
Memory location  : Please put data memory location here
			(e.g. code in flash, data on heap etc)
seedcrc          : 0xe9f5
[0]crclist       : 0xe714
[0]crcmatrix     : 0x1fd7
[0]crcstate      : 0x8e3a
[0]crcfinal      : 0x5275
Correct operation validated. See README.md for run and reporting rules.
CoreMark 1.0 : 1758.355625 / GCC9.2.0 -O2    / Heap
[root@vc709 riscv-coremark]#
[root@vc709 ubuntu]#./coremark.riscv 
2K performance run parameters for coremark.
CoreMark Size    : 666
Total ticks      : 15502777771
Total time (secs): 15.502778
Iterations/Sec   : 1935.137073
Iterations       : 30000
Compiler version : GCC9.2.0
Compiler flags   : -O2   
Memory location  : Please put data memory location here
                        (e.g. code in flash, data on heap etc)
seedcrc          : 0xe9f5
[0]crclist       : 0xe714
[0]crcmatrix     : 0x1fd7
[0]crcstate      : 0x8e3a
[0]crcfinal      : 0x5275
Correct operation validated. See README.md for run and reporting rules.
CoreMark 1.0 : 1935.137073 / GCC9.2.0 -O2    / Heap
```

~~~
[root@vc709 riscv-coremark]#./coremark.riscv 
2K performance run parameters for coremark.
CoreMark Size    : 666
Total ticks      : 15305050223
Total time (secs): 15.305050
Iterations/Sec   : 1960.137312
Iterations       : 30000
Compiler version : GCC9.2.0
Compiler flags   : -O2   
Memory location  : Please put data memory location here
                        (e.g. code in flash, data on heap etc)
seedcrc          : 0xe9f5
[0]crclist       : 0xe714
[0]crcmatrix     : 0x1fd7
[0]crcstate      : 0x8e3a
[0]crcfinal      : 0x5275
Correct operation validated. See README.md for run and reporting rules.
CoreMark 1.0 : 1960.137312 / GCC9.2.0 -O2    / Heap

[root@vc709 riscv-coremark]#./coremark.riscv

2K performance run parameters for coremark.
CoreMark Size    : 666
Total ticks      : 15155817904
Total time (secs): 15.155818
Iterations/Sec   : 1979.437876
Iterations       : 30000
Compiler version : GCC9.2.0
Compiler flags   : -O2   
Memory location  : Please put data memory location here
                        (e.g. code in flash, data on heap etc)
seedcrc          : 0xe9f5
[0]crclist       : 0xe714
[0]crcmatrix     : 0x1fd7
[0]crcstate      : 0x8e3a
[0]crcfinal      : 0x5275
Correct operation validated. See README.md for run and reporting rules.
CoreMark 1.0 : 1979.437876 / GCC9.2.0 -O2    / Heap
[root@vc709 riscv-coremark]#
[root@vc709 riscv-coremark]#./coremark.riscv
remark.riscv

2K performance run parameters for coremark.
CoreMark Size    : 666
Total ticks      : 13816257274
Total time (secs): 13.816257
Iterations/Sec   : 2171.355050
Iterations       : 30000
Compiler version : GCC9.2.0
Compiler flags   : -O2   
Memory location  : Please put data memory location here
                        (e.g. code in flash, data on heap etc)
seedcrc          : 0xe9f5
[0]crclist       : 0xe714
[0]crcmatrix     : 0x1fd7
[0]crcstate      : 0x8e3a
[0]crcfinal      : 0x5275
Correct operation validated. See README.md for run and reporting rules.
CoreMark 1.0 : 2171.355050 / GCC9.2.0 -O2    / Heap
[root@vc709 riscv-coremark]#
[root@vc709 riscv-coremark]#
[root@vc709 riscv-coremark]#./coremark.riscv
./coremark.riscv
2K performance run parameters for coremark.
CoreMark Size    : 666
Total ticks      : 13783314717
Total time (secs): 13.783315
Iterations/Sec   : 2176.544657
Iterations       : 30000
Compiler version : GCC9.2.0
Compiler flags   : -O2   
Memory location  : Please put data memory location here
                        (e.g. code in flash, data on heap etc)
seedcrc          : 0xe9f5
[0]crclist       : 0xe714
[0]crcmatrix     : 0x1fd7
[0]crcstate      : 0x8e3a
[0]crcfinal      : 0x5275
Correct operation validated. See README.md for run and reporting rules.
CoreMark 1.0 : 2176.544657 / GCC9.2.0 -O2    / Heap
[root@vc709 riscv-coremark]#
~~~

## mibench
```
# automotive {basicmath  bitcount  qsort  susan}
# consumer {jpeg  lame typeset}
# network {dijkstra  patricia}
# office { stringsearch }
# security {blowfish  sha}
# telecomm {adpcm  CRC32  FFT  gsm}

./find-make.sh | sort | sed 's/^\./vim $MIBENCH/g'

./run.sh | grep -E 'SHELL|RISC-V|DATA|PATH' | sed 's/.* //g' | sort | uniq | xargs tar -zcvf mibench.tar.gz
ls -lh
tar -zxvf mibench.tar.gz -C $ROOTFS/home/ubuntu/mibench
cp runme.sh $ROOTFS/home/ubuntu/mibench/
ll $ROOTFS/home/ubuntu/mibench/
```

```
# installation program
INSTALL= /usr/bin/install -c
INSTALL_PROGRAM= ${INSTALL}
INSTALL_DATA= ${INSTALL} -m 644
```
## rv8-bench
```
git clone https://github.com/rv8-io/musl-riscv-toolchain.git
cd ~/musl-riscv-toolchain
sudo ./bootstrap.sh riscv64
```
## mbedtls benchmark

https://blog.csdn.net/xukai871105/article/details/72795126

```
git clone https://github.com/ARMmbed/mbedtls.git
cd mbedtls
mkdir build && cd build
CC=riscv64-unknown-linux-gnu-gcc cmake -DCMAKE_INSTALL_PREFIX=$SYSROOT -DUSE_SHARED_MBEDTLS_LIBRARY=On -D CMAKE_BUILD_TYPE=Release ../
make && make install

# benchmark binary and library
cp -p $SYSROOT/bin/benchmark $ROOTFS/bin
cp -p $SYSROOT/lib/libmbedcrypto.so.3.0.0 $ROOTFS/lib
cd $ROOTFS/lib
ln -s libmbedcrypto.so.3.0.0 libmbedcrypto.so.10
```
## lmbench3 [X]
http://www.bitmover.com/lmbench/get_lmbench.html
```
git restore scripts/os scripts/compiler
sed -i '19a OS=riscv64-unknown-linux-gnu' scripts/os
sed -i '15a CC=riscv64-unknown-linux-gnu-gcc' scripts/compiler

vim scripts/build
LDLIBS=-static -lm
vim src/Makefile

make && make release

===== doc =====
make[2]: bk: Command not found
===== src =====
make[2]: bk: Command not found
===== results =====
make[2]: bk: Command not found
===== scripts =====
make[2]: bk: Command not found
make[1]: bk: Command not found
```
## cpu2017

```
modprobe isofs
mount -t iso9660 ./cpu2017-1_0_2.iso /mnt/cdrom
mount -t iso9660 ./openSUSE-Tumbleweed-DVD-riscv64-Media.iso /mnt/cdrom
zypper addrepo /mnt/cdrom openSUSE-Tumbleweed-DVD-riscv64-Media
zypper ref openSUSE-Tumbleweed-DVD-riscv64-Media

runcpu --action clean -c Example-gcc-linux-riscv64.cfg all
runcpu --action buildsetup -c Example-gcc-linux-riscv64.cfg all
```
## riscv-tests
```
ubuntu@optiplex-5060:~/chipyard/toolchains/riscv-tools/riscv-tests$ vim benchmarks/bcs/bcs.c
ubuntu@optiplex-5060:~/chipyard/toolchains/riscv-tools/riscv-tests$ make install prefix=~/chipyard/riscv-tools-install/riscv64-unknown-elf
ubuntu@optiplex-5060:~/chipyard/sims/verilator$ make run-bmark-tests
```

```
BCS test started.
read bcs[0, 0, 0]
write bcs[0, 80001784, 800018c8]
update bcs[6a6c72766a6c7276, 6a6c72766a6c7276, 80001784, 800018c8]
BCS test passed!
```
