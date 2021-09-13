#!/bin/bash

# build AFL-riscv.rpm
rpmbuild -ba AFL-2.57b.spec

# build afl-clang-fast
make && make -c llvm_mode
sudo make install

# cross-compile llvm-mode
export CC=clang
export CXX=clang
export CFLAGS="--gcc-toolchain=$TOOLCHAIN --sysroot=$SYSROOT --target=$TARGET -march=$MARCH"
export AFL_NO_X86=1
export LLVM_CONFIG=/usr/bin/llvm-config-12

make -C llvm_mode
sudo install -m 755 afl-llvm-rt-32.o /usr/local/lib/afl/
sudo install -m 755 afl-llvm-rt-64.o /usr/local/lib/afl/
sudo install -m 755 afl-llvm-rt.o    /usr/local/lib/afl/
sudo install -m 755 afl-llvm-pass.so /usr/local/lib/afl/

# cross-compile with afl-clang-fast
afl-clang-fast --gcc-toolchain=$TOOLCHAIN --sysroot=$SYSROOT --target=$TARGET -march=$MARCH afl_test.c -o afl_test

rsync -azvpP --exclude=output ~/test/ -e 'dbclient -p 2222' root@vc709:~/test/

# run on vc709
AFL_SKIP_CPUFREQ=1 afl-fuzz -i testcase -o output ./afl_test

afl-fuzz -i testcase -o sync_dir -M fuzzer01 ./afl_test
afl-fuzz -i testcase -o sync_dir -S fuzzer02 ./afl_test
afl-fuzz -i testcase -o sync_dir -S fuzzer03 ./afl_test
afl-fuzz -i testcase -o sync_dir -S fuzzer04 ./afl_test

afl-fuzz -i - -o sync_dir -M fuzzer01 zstd
afl-fuzz -i - -o sync_dir -S fuzzer02 zstd
afl-fuzz -i - -o sync_dir -S fuzzer03 zstd
afl-fuzz -i - -o sync_dir -S fuzzer04 zstd
