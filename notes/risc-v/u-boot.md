# u-boot
```
make CROSS_COMPILE=riscv64-unknown-linux-gnu- rocketchip_vc709_defconfig
make CROSS_COMPILE=riscv64-unknown-linux-gnu- menuconfig
make CROSS_COMPILE=riscv64-unknown-linux-gnu- ARCH=riscv u-boot.bin u-boot.dtb u-boot-dtb.bin
sudo dd if=u-boot.bin  of=/dev/sdb1 seek=2  status=progress oflag=sync bs=1M
sudo dd if=u-boot-dtb.bin  of=/dev/sdb1 seek=2  status=progress oflag=sync bs=1M
```
```
grub> linux /boot/Image-5.16.11-1-default root=UUID=ad94e29b-d09c-43dc-9fe4-1ecdb2d6e897  loglevel=3 console=ttySIF0,921600 console=ttySIF0,921600          
grub> initrd /boot/initrd-5.16.11-1-default

	append root=/dev/mmcblk0p5 rootfstype=ext4 rootwait console=ttySIF0,921600n8 console=ttySIF1,921600n8 earlycon=sbi
	
=> mmc dev 1
switch to partitions #0, OK
mmc1 is current device
=> mmc list 
spi@64001000:mmc@0: 0 (SD)
spi@64004000:mmc@0: 1 (SD)

U-Boot 2021.10-rc3-00052-g346cd2384b-dirty (Mar 07 2022 - 15:06:01 +0800)

CPU:   rv64imafdc
Model: freechips,rocketchip-unknown
DRAM:  4 GiB
MMC:   spi@64001000:mmc@0: 0, spi@64004000:mmc@0: 1
Loading Environment from nowhere... OK
In:    serial@64000000
Out:   serial@64000000
Err:   serial@64000000
Net:   No ethernet found.
Hit any key to stop autoboot:  0 
=> sysboot mmc 1:5 any ${scriptaddr} /boot/extlinux/extlinux.conf
Retrieving file: /boot/extlinux/extlinux.conf
875 bytes read in 23 ms (37.1 KiB/s)
U-Boot menu
1:	Ubuntu 20.04.4 LTS 5.11.0-1029-generic
2:	Ubuntu 20.04.4 LTS 5.11.0-1029-generic (rescue target)
Enter choice: 1
1:	Ubuntu 20.04.4 LTS 5.11.0-1029-generic
Retrieving file: /boot/initrd.img-5.11.0-1029-generic
178849819 bytes read in 584506 ms (297.9 KiB/s)
Retrieving file: /boot/vmlinuz-5.11.0-1029-generic
29453824 bytes read in 96256 ms (297.9 KiB/s)
append: root=/dev/mmcblk0p5 rw rootfstype=ext4 rootwait earlycon=sbi console=ttySIF0,921600n8 console=ttySIF1,921600n8
Retrieving file: /lib/firmware/5.11.0-1029-generic/device-tree/rocketchip/rocketchip-vc709.dtb
11883 bytes read in 144 ms (80.1 KiB/s)
Moving Image from 0x84000000 to 0x80200000, end=81f0f000
## Flattened Device Tree blob at 82200000
   Booting using the fdt blob at 0x82200000
   Loading Ramdisk to f556f000, end fffff81b ... 
```
```
ext4load mmc 1:5 ${kernel_addr_r} /boot/vmlinuz-5.11.0-1029-generic
ext4load mmc 1:5 ${kernel_addr_r} /boot/vmlinuz-5.11.0-1029-generic
ext4load mmc 1:5 ${kernel_addr_r} /boot/vmlinuz-5.11.0-1029-generic

bootefi bootmgr ${fdt_addr_r};

=> ext4load mmc 0:5 ${kernel_addr_r} /boot/Image
24583536 bytes read in 75449 ms (317.4 KiB/s)
=> ext4load mmc 0:5 ${ramdisk_addr_r} /boot/initrd
134912080 bytes read in 414269 ms (317.4 KiB/s)
=> ext4load mmc 0:5 ${fdt_addr_r} /boot/dtb/rocketchip/rocketchip-vc709.dtb   
12513 bytes read in 67 ms (181.6 KiB/s)
=> booti ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr_r}


=> ext4load mmc 0:5 ${fdt_addr_r} u-boot.dtb
=> booti ${kernel_addr_r} - ${fdt_addr_r}
```
```
=> ext4load mmc 0:3 ${kernel_addr_r} /EFI/BOOT/bootriscv64.efi       
=> bootefi ${kernel_addr_r} ${fdt_addr_r}

=> fatload mmc 0:3 ${kernel_addr_r} Image
24574320 bytes read in 75476 ms (317.4 KiB/s)
=> fatload mmc 0:3 ${fdt_addr_r} u-boot.dtb
12525 bytes read in 104 ms (117.2 KiB/s)
=> booti ${kernel_addr_r} - ${fdt_addr_r}
```

## Fedora
```
=> sysboot mmc 1:3 any ${scriptaddr} /extlinux/extlinux.conf     
Retrieving file: /extlinux/extlinux.conf
650 bytes read in 16 ms (39.1 KiB/s)
Ignoring unknown command: ui
Ignoring malformed menu command:  autoboot
Ignoring malformed menu command:  hidden
Ignoring unknown command: totaltimeout
1:      Fedora-Developer-Rawhide-20211110.n.0 (5.14.16-101.0.riscv64.fc33.riscv64)
Retrieving file: /initramfs-5.14.16-101.0.riscv64.fc33.riscv64.img.new
16783915 bytes read in 54457 ms (300.8 KiB/s)
Retrieving file: /vmlinuz-5.14.16-101.0.riscv64.fc33.riscv64
9927496 bytes read in 32390 ms (298.8 KiB/s)
append: ro root=UUID=1abf5c6d-3827-4beb-8b8b-3d39e5e14d6d LANG=en_US.UTF-8 loglevel=3 console=ttySIF0,921600 earlycon=sbi
Retrieving file: /dtb-5.14.16-101.0.riscv64.fc33.riscv64/rocketchip/rocketchip-vc709.dtb
12265 bytes read in 72 ms (166 KiB/s)
   Uncompressing Kernel Image
Moving Image from 0x84000000 to 0x80200000, end=82155000
## Flattened Device Tree blob at ffe00000
   Booting using the fdt blob at 0xffe00000
   Using Device Tree in place at 00000000ffe00000, end 00000000ffe05fe8
```