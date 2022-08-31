# Open SBI
```
dtb=$1
echo Device Tree: $dtb

cd ./opensbi
# 2MB for fw_jump.bin, 2MB for u-boot.dtb
make PLATFORM=generic CROSS_COMPILE=riscv64-unknown-elf- PLATFORM_RISCV_XLEN=64 FW_JUMP=y FW_JUMP_ADDR=0x80200000 FW_JUMP_FDT_ADDR=0x82200000 clean
make PLATFORM=generic CROSS_COMPILE=riscv64-unknown-elf- PLATFORM_RISCV_XLEN=64 FW_JUMP=y FW_JUMP_ADDR=0x80200000 FW_JUMP_FDT_ADDR=0x82200000 install
```

### kernel
```
cd ~/linux
make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- menuconfig
make -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu-

export ROOTFS=/media/ubuntu/sdcard
make modules_install -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- INSTALL_MOD_PATH=$ROOTFS
make headers_install -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- INSTALL_HDR_PATH=$ROOTFS/usr

make modules_install -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- INSTALL_MOD_PATH=$SYSROOT
make headers_install -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- INSTALL_HDR_PATH=$SYSROOT/usr

ls -lh ~/linux/arch/riscv/boot/Image
```

### bootrom
```
cp ~/chipyard/fpga/generated-src/chipyard.fpga.vc709.VC709FPGATestHarness.RocketVC709Config/chipyard.fpga.vc709.VC709FPGATestHarness.RocketVC709Config.dts ./
CONFIG=chipyard.fpga.vc709.VC709FPGATestHarness.RocketVC709Config
dtc -I dts -O dtb -o $CONFIG.dtb $CONFIG.dts

cp ~/linux/arch/riscv/boot/Image ./Image
sudo ./write-boot.sh /dev/sdb1 chipyard.fpga.vc709.VC709FPGATestHarness.RocketVC709Config.dtb
```

```
echo 0 > /proc/sys/kernel/hung_task_timeout_secs
```

## ketstone/sm
```
make -C /home/ubuntu/keystone/sm/opensbi O=/home/ubuntu/keystone/build/sm.build PLATFORM_DIR=/home/ubuntu/keystone/sm/plat/generic CROSS_COMPILE=riscv64-unknown-elf- PLATFORM_RISCV_XLEN=64 PLATFORM_RISCV_ISA=rv64imafdc PLATFORM_RISCV_ABI=lp64d FW_JUMP=y FW_JUMP_ADDR=0x80200000 FW_JUMP_FDT_ADDR=0x82700000
```

## keystone/linux-keystone-driver
```
make -C $FIREMARSHAL_LINUX_SRC O=/home/ubuntu/keystone/build/linux.build CROSS_COMPILE=riscv64-unknown-linux-gnu- ARCH=riscv M=/home/ubuntu/keystone/build/linux-keystone-driver.build modules
```

## keystone/tests
```
[root@vc709 tests]#time -p ./run-test.sh
testing stack
testing loop
testing malloc
testing long-nop
testing fibonacci
testing fib-bench
testing attestation
Attestation report is invalid
testing untrusted
Enclave said: hello world!
Enclave said: 2nd hello world!
Enclave said value: 13
Enclave said value: 20
testing data-sealing
Enclave said: Sealing key derivation successful!
real 548.73
user 20.20
sys 527.64
[root@vc709 tests]#time -p ./run-test.sh
testing stack
testing loop
testing malloc
testing long-nop
testing fibonacci
testing fib-bench
testing attestation
Attestation report is invalid
testing untrusted
Enclave said: hello world!
Enclave said: 2nd hello world!
Enclave said value: 13
Enclave said value: 20
testing data-sealing
Enclave said: Sealing key derivation successful!
real 548.73
user 17.82
sys 530.19
[root@vc709 hello]#time -p ./hello-runner hello eyrie-rt
hello, world!
real 38.83
user 6.17
sys 28.38
[root@vc709 hello]#cd ../tests
```
## nvdla_compiler
```
./nvdla_compiler --prototxt ~/CaffeModels/AlexNet/Alexnet.prototxt --caffemodel ~/CaffeModels/AlexNet/bvlc_alexnet.caffemodel -o . --profile fast-math --cprecision int8 --configtarget nv_small --quantizationMode per-filter --batch 1 --informat nhwc
```
## nvdla_runtime
```
[root@vc709 custom]#./nvdla_runtime --loadable ~/home/lenet-mnist-caffe/fast-math.nvdla --image ~/home/lenet-mnist-caffe/Images/0_8.jpg --rawdump
creating new runtime context...
dlaimg height: 28 x 28 x 1: LS: 224 SS: 0 Size: 6272
submitting tasks...
execution time = 1092344.000000 s
Test pass
[root@vc709 custom]#
[root@vc709 custom]#./nvdla_runtime --loadable ./models/imagenet/resnet50_small.nvdla --image ./models/imagenet/dog.jpg --rawdump
[root@vc709 custom]#./nvdla_runtime --loadable ./models/imagenet/resnet50_small.nvdla --image ./models/imagenet/dog.jpg --rawdump
creating new runtime context...
dlaimg height: 224 x 224 x 3: LS: 1792 SS: 0 Size: 401408
submitting tasks...
execution time = 9174054.000000 s
Test pass
[root@vc709 custom]#
[root@vc709 custom]#time -p ./nvdla_runtime --loadable ./models/imagenet/resnet5
0_small.nvdla --image ./models/imagenet/dog.jpg --rawdump
creating new runtime context...
dlaimg height: 224 x 224 x 3: LS: 1792 SS: 0 Size: 401408
submitting tasks...
execution time = 9183010.000000 s
Test pass
real 28.25
user 16.55
sys 11.16
[root@vc709 custom]#time -p ./nvdla_runtime --loadable ~/home/lenet-mnist-caffe/
fast-math.nvdla --image ~/home/lenet-mnist-caffe/Images/0_8.jpg --rawdump
creating new runtime context...
dlaimg height: 28 x 28 x 1: LS: 224 SS: 0 Size: 6272
submitting tasks...
execution time = 410195.000000 s
Test pass
real 1.30
user 0.44
sys 0.59
[root@vc709 custom]#
[root@vc709 custom]#time -p ./nvdla_runtime --loadable ./models/imagenet/resnet5
0_small.nvdla --image ./models/imagenet/boat.jpg --rawdump
creating new runtime context...
dlaimg height: 224 x 224 x 3: LS: 1792 SS: 0 Size: 401408
submitting tasks...
execution time = 9215132.000000 s
Test pass
real 28.48
user 16.34
sys 11.13
[root@vc709 custom]#time -p ./nvdla_runtime --loadable ~/home/nvdla_loadables/resnet18-imagenet-caffe/loadables/fast-math.nvdla --image ~/home/nvd
la_loadables/resnet18-imagenet-caffe/resized/403_aircraft_carrier.jpg --rawdump
creating new runtime context...
dlaimg height: 224 x 224 x 3: LS: 1792 SS: 0 Size: 401408
submitting tasks...
execution time = 2703919.000000 s
Test pass
real 188.12
user 8.04
sys 5.23
[root@vc709 custom]#
[root@vc709 tests]#./run-test.sh 
testing stack
[keystone-test] Init: 27100870033 cycles
[keystone-test] Runtime: 3203989 cycles
testing loop
[keystone-test] Init: 18446744050966219543 cycles
[keystone-test] Runtime: 37205498 cycles
testing malloc
[keystone-test] Init: 18446744053510698678 cycles
[keystone-test] Runtime: 2858898 cycles
testing long-nop
[keystone-test] Init: 18446744051798813557 cycles
[keystone-test] Runtime: 2817460 cycles
testing fibonacci
[keystone-test] Init: 18446744029153765826 cycles
[keystone-test] Runtime: 1027367397 cycles
testing fib-bench
testing attestation
Attestation report is invalid
[keystone-test] Init: 18446743952203458236 cycles
[keystone-test] Runtime: 18786031 cycles
testing untrusted
Enclave said: hello world!
Enclave said: 2nd hello world!
Enclave said value: 13
Enclave said value: 20
[keystone-test] Init: 2581098619 cycles
[keystone-test] Runtime: 3178837 cycles
testing data-sealing
Enclave said: Sealing key derivation successful!
[keystone-test] Init: 18446744030939872831 cycles
[keystone-test] Runtime: 5525969 cycles
[root@vc709 tests]#
```