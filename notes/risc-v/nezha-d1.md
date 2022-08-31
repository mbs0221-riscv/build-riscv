# D1开发板
```
ubuntu@optiplex-5060:~/d1-fedora/sun20i_d1_spl$ make CROSS_COMPILE=riscv64-linux-gnu- p=sun20iw1p1 mmc
ubuntu@optiplex-5060:~/d1-fedora/sun20i_d1_spl$ sudo dd if=nboot/boot0_sdcard_sun20iw1p1.bin of=/dev/sdb bs=512 seek=16
ubuntu@optiplex-5060:~/d1-fedora/opensbi$ CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=generic FW_PIC=y make
ubuntu@optiplex-5060:~/d1-fedora/opensbi$ sudo dd if=build/platform/generic/firmware/fw_dynamic.bin of=/dev/sdb bs=512 seek=32800
```

```
DRAM only have internal ZQ!!
get_pmu_exist() = 4294967295
ddr_efuse_type: 0x0
[AUTO DEBUG] two rank and full DQ!
ddr_efuse_type: 0x0
[AUTO DEBUG] rank 0 row = 16 
[AUTO DEBUG] rank 0 bank = 8 
[AUTO DEBUG] rank 0 page size = 2 KB 
[AUTO DEBUG] rank 1 row = 16 
[AUTO DEBUG] rank 1 bank = 8 
[AUTO DEBUG] rank 1 page size = 2 KB 
rank1 config same as rank0
DRAM BOOT DRIVE INFO: %s
DRAM CLK = 792 MHz
DRAM Type = 3 (2:DDR2,3:DDR3)
DRAMC ZQ value: 0x7b7bfb
DRAM ODT value: 0x42.
ddr_efuse_type: 0x0
DRAM SIZE =2048 M
DRAM simple test OK.
```
## Fedora
```
root@RVBoards:~# systemctl restart wpa_supplicant
```
## opensbi
```
ubuntu@optiplex-5060:~/d1-nezha-baremeta/opensbi$ export CROSS_COMPILE=/home/ubuntu/toolchain-thead-glibc/riscv64-glibc-gcc-thead_20200702/bin/riscv64-unknown-linux-gnu- PLATFORM_RISCV_ISA=rv64gcxthead PLATFORM=thead/c910 FW_JUMP_ADDR=0x40200000 FW_TEXT_START=0x40000000
ubuntu@optiplex-5060:~/d1-nezha-baremeta/opensbi$ make -j12
```

https://d1.docs.aw-ol.com/study/study_3ubuntu/

[可编译Tina的Oraclr VM VirtualBox Ubuntu14.04虚拟机](http://netstorage.allwinnertech.com:5000/sharing/O9qgg77dD)