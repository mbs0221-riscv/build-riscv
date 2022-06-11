# Linux
## 修改内存占用率
```
cat /proc/sys/vm/swappiness
sudo sysctl vm.swappiness=20
vim /etc/sysctl.conf
  vm.swappiness = 10
sysctl -p
```

```
echo 0 > /proc/sys/kernel/hung_task_timeout_secs
```

## ps -ef
```
ps -ef | grep pppd | awk '{print $2}' | uniq | xargs sudo kill -9
```

## Huge Page
HugeTable 显著减少页表项，提高TLB命中率，能够对于内存需求很大的程序有一定的加速，尤其是哪些访存没有很好的局部性的程序，比如说数据库底层的B+树索引检索等。

查看是否启用透明大页，该命令适用于其它Linux系统
```
$ $ cat /sys/kernel/mm/transparent_hugepage/enabled
```

Linux：taskset 查询或设置进程（线程）绑定CPU（亲和性）
```
$ cat /proc/cpuinfo | grep process
$ taskset -pc 11498
$ taskset -p 11498
$ taskset -h
```
See https://wiki.debian.org/Hugepages for more information on how to set up hugetlbfs. The 2M page can be allocated by using the following command:

```
$ truncate -s 2097152 /hugepages/foo
```

## edk2
```
ubuntu@optiplex-5060:~/tianocore$ export WORKSPACE=$PWD
ubuntu@optiplex-5060:~/tianocore$ export PACKAGES_PATH=$PWD/edk2:$PWD/edk2-platforms:$PWD/edk2-non-osi
ubuntu@optiplex-5060:~/tianocore$ . edk2/edksetup.sh BaseTools
ubuntu@optiplex-5060:~/tianocore$ make -C edk2/BaseTools
ubuntu@optiplex-5060:~/tianocore$ make -C edk2/BaseTools/Source/C
ubuntu@optiplex-5060:~/tianocore$ vim edk2/Conf/target.txt
ubuntu@optiplex-5060:~/tianocore$ export GCC5_RISCV64_PREFIX=riscv64-unknown-elf-
ubuntu@optiplex-5060:~/tianocore$ NUM_CPUS=$((`getconf _NPROCESSORS_ONLN` + 2))
ubuntu@optiplex-5060:~/tianocore/edk2-platforms$ build -n $NUM_CPUS -a RISCV64 -t GCC5 -p Platform/RISC-V/PlatformPkg/RiscVPlatformPkg.dsc
ubuntu@optiplex-5060:~/tianocore$ ll Build/RiscVPlatform/RELEASE_GCC5/
total 148K
drwxrwxr-x 5 ubuntu ubuntu 4.0K 12月 15 19:27 ../
-rw-rw-r-- 1 ubuntu ubuntu  164 12月 15 19:27 BuildOptions
-rw-rw-r-- 1 ubuntu ubuntu   16 12月 15 19:27 PcdTokenNumber
drwxrwxr-x 7 ubuntu ubuntu 4.0K 12月 15 19:32 RISCV64/
-rw-rw-r-- 1 ubuntu ubuntu    0 12月 15 19:32 RiscVPlatform.map
-rw-rw-r-- 1 ubuntu ubuntu  872 12月 15 19:47 AutoGen
drwxrwxr-x 3 ubuntu ubuntu 4.0K 12月 15 19:47 ./
-rw-rw-r-- 1 ubuntu ubuntu 121K 12月 15 19:47 GlobalVar_840A9576-5869-491E-9210-89769DED4650_RISCV64.bin
ubuntu@optiplex-5060:~/tianocore$ ll Build/RiscVPlatform/RELEASE_GCC5/RISCV64/
total 2.7M
drwxrwxr-x 3 ubuntu ubuntu 4.0K 12月 15 19:27 Platform/
drwxrwxr-x 3 ubuntu ubuntu 4.0K 12月 15 19:27 MdePkg/
drwxrwxr-x 3 ubuntu ubuntu 4.0K 12月 15 19:27 MdeModulePkg/
drwxrwxr-x 3 ubuntu ubuntu 4.0K 12月 15 19:27 Silicon/
drwxrwxr-x 3 ubuntu ubuntu 4.0K 12月 15 19:27 EmbeddedPkg/
-rw-rw-r-- 1 ubuntu ubuntu 5.4K 12月 15 19:32 TOOLS_DEF.RISCV64
-rwxrwxr-x 1 ubuntu ubuntu 2.5M 12月 15 19:32 SecMain.debug*
-rw-rw-r-- 1 ubuntu ubuntu 137K 12月 15 19:32 SecMain.efi
drwxrwxr-x 7 ubuntu ubuntu 4.0K 12月 15 19:32 ./
drwxrwxr-x 3 ubuntu ubuntu 4.0K 12月 15 19:47 ../
ubuntu@optiplex-5060:~/tianocore$ ll Build/RiscVPlatform/RELEASE_GCC5/RISCV64/
```

## systemd
```
vc709:~ # systemd-analyze blame
17min 43.982s initrd-switch-root.service
 9min 47.913s systemd-tmpfiles-clean.service
 7min 27.106s issue-generator.service
 6min 33.045s kbdsettings.service
 4min 53.342s systemd-tmpfiles-setup-dev.service
 3min 31.018s dracut-initqueue.service
   2min 576ms modprobe@fuse.service
 1min 46.536s systemd-udev-trigger.service
 1min 38.221s dev-disk-by\x2duuid-5f92899c\x2d5707\x2d43ec\x2d8219\x2d8be6dffdd09a.swap
 1min 37.385s modprobe@configfs.service
 1min 30.189s systemd-journal-flush.service
 1min 26.681s systemd-udevd.service
 1min 11.190s systemd-sysctl.service
  1min 2.671s user@0.service
  1min 1.371s systemd-random-seed.service
      57.622s sshd.service
      56.134s systemd-fsck-root.service
      49.869s systemd-remount-fs.service
      49.764s boot-efi.mount
      42.895s sys-kernel-debug.mount
      41.424s kmod-static-nodes.service
      41.304s initrd-parse-etc.service
      26.014s systemd-tmpfiles-setup.service
      25.275s dev-hugepages.mount
      25.159s dev-mqueue.mount
      24.662s kernel-sysctl.service
      23.359s sys-kernel-config.mount
      14.908s lvm2-monitor.service
      13.356s systemd-modules-load.service
      10.676s dracut-cmdline.service
       7.493s systemd-vconsole-setup.service
       6.243s systemd-logind.service
       3.876s systemd-user-sessions.service
       3.433s dracut-pre-udev.service
       2.995s initrd-cleanup.service
       2.313s systemd-update-utmp.service
       1.774s dracut-shutdown.service
       1.695s user-runtime-dir@0.service
       1.115s systemd-journald.service
       1.073s initrd-udevadm-cleanup-db.service
        490ms tmp.mount
        476ms modprobe@drm.service
        273ms sys-fs-fuse-connections.mount
vc709:~ # 
```

## u-boot
```
  │ │                                [*] Enable JFFS2 filesystem support                                                                    │ │  
  │ │                                [*] UBIFS silence verbose messages                                                                     │ │  
  │ │                                [*] Enable CRAMFS filesystem support                                                                   │ │  
  │ │                                [*] YAFFS2 filesystem support                                                                          │ │  
  │ │                                [*] Enable SquashFS filesystem support                                                                 │ │  
```

## MENUCONFIG
```
Device Drivers-> GPIO Support ->/sys/class/gpio/… (sysfs interface)

  │ Symbol: KPROBES [=y]                                                                                                                      │  
  │ Type  : bool                                                                                                                              │  
  │ Defined at arch/Kconfig:36                                                                                                                │  
  │   Prompt: Kprobes                                                                                                                         │  
  │   Depends on: MODULES [=y] && HAVE_KPROBES [=y]                                                                                           │  
  │   Location:                                                                                                                               │  
  │     -> General architecture-dependent options                                                                                             │  
  │ Selects: KALLSYMS [=y]                                                                                                                    │  
  │ Selected by [n]:                                                                                                                          │  
  │   - KGDB_HONOUR_BLOCKLIST [=n] && KGDB [=n] && HAVE_KPROBES [=y] && MODULES [=y]                                                          │  

  │ Symbol: FTRACE [=y]                                                                                                                       │  
  │ Type  : bool                                                                                                                              │  
  │ Defined at kernel/trace/Kconfig:140                                                                                                       │  
  │   Prompt: Tracers                                                                                                                         │  
  │   Depends on: TRACING_SUPPORT [=y]                                                                                                        │  
  │   Location:                                                                                                                               │  
  │     -> Kernel hacking                                                                                                                     │  

```

## sdboot
```
sudo dd if=/dev/sdb of=/nfsroot/sdcard.img bs=2M
```
```
ubuntu@optiplex-5060:/nfsroot$ sudo gdisk /dev/sdb
GPT fdisk (gdisk) version 1.0.5

Partition table scan:
  MBR: MBR only
  BSD: not present
  APM: not present
  GPT: not present


***************************************************************
Found invalid GPT and valid MBR; converting MBR to GPT format
in memory. THIS OPERATION IS POTENTIALLY DESTRUCTIVE! Exit by
typing 'q' if you don't want to convert your MBR partitions
to GPT format!
***************************************************************


Warning! Secondary partition table overlaps the last partition by
33 blocks!
You will need to delete this partition or resize it in another utility.

Command (? for help): x

Expert command (? for help): l
Enter the sector alignment value (1-65536, default = 2048): 1

Expert command (? for help): m

Command (? for help): d
Partition number (1-2): 1

Command (? for help): d
Using 2

Command (? for help): 

Command (? for help): d
No partitions

Command (? for help): n
Partition number (1-128, default 1): 
First sector (34-60874718, default = 34) or {+-}size{KMGTP}: 
Last sector (34-60874718, default = 60874718) or {+-}size{KMGTP}: +1048576
Current type is 8300 (Linux filesystem)
Hex code or GUID (L to show codes, Enter = 8300): L
Type search string, or <Enter> to show all codes: apfs
af0a Apple APFS                          
Hex code or GUID (L to show codes, Enter = 8300): af0a
Changed type of partition to 'Apple APFS'

Command (? for help): n
Partition number (2-128, default 2): 
First sector (16777250-60874718, default = 16777250) or {+-}size{KMGTP}: 
Last sector (16777250-60874718, default = 60874718) or {+-}size{KMGTP}: 
Current type is 8300 (Linux filesystem)
Hex code or GUID (L to show codes, Enter = 8300): L  
Type search string, or <Enter> to show all codes: hfs
af00 Apple HFS/HFS+                      
Hex code or GUID (L to show codes, Enter = 8300): af00
Changed type of partition to 'Apple HFS/HFS+'

Command (? for help): w

Final checks complete. About to write GPT data. THIS WILL OVERWRITE EXISTING
PARTITIONS!!

Do you want to proceed? (Y/N): Y
OK; writing new GUID partition table (GPT) to /dev/sdb.
Warning: The kernel is still using the old partition table.
The new table will be used at the next reboot or after you
run partprobe(8) or kpartx(8)
The operation has completed successfully.
ubuntu@optiplex-5060:/nfsroot$ 
ubuntu@optiplex-5060:/nfsroot$ sudo apt install hfsprogs
ubuntu@optiplex-5060:/nfsroot$ sudo mkfs.ext3 /dev/sdb1
ubuntu@optiplex-5060:/nfsroot$ sudo mkfs.hfs -v "PrototypeData" /dev/sdb2
ubuntu@optiplex-5060:/nfsroot$ sudo mkfs.f2fs -f -l boot /dev/sdb1
ubuntu@optiplex-5060:/nfsroot$ sudo mkfs.f2fs -f -l sdcard /dev/sdb2

	F2FS-tools: mkfs.f2fs Ver: 1.11.0 (2018-07-10)

Info: Disable heap-based policy
Info: Debug level = 0
Info: Label = sdcard
Info: Trim is enabled
Info: [/dev/sdb] Disk Model: Storage Device  1.00
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 60874752 (29724 MB)
Info: zone aligned segment0 blkaddr: 512
Info: format version with
  "Linux version 5.4.0-81-generic (buildd@lgw01-amd64-052) (gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)) #91-Ubuntu SMP Thu Jul 15 19:09:17 UTC 2021"
Info: [/dev/sdb] Discarding device
Info: This device doesn't support BLKSECDISCARD
Info: This device doesn't support BLKDISCARD
Info: Overprovision ratio = 1.160%
Info: Overprovision segments = 349 (GC reserved = 180)
Info: format successful
```

```
mksquashfs squashfs-root/ squashfs.img -comp xz -Xbcj x86 -e boot
```

```
find . | cpio -H newc -o > /nfsroot/rootfs.cpio
sudo cpio -i -u -I /nfsroot/rootfs.cpio
```

```
rsync -azvpP ~/rpmbuild/RPMS /media/ubuntu/3730-6230/rootfs/
rsync -azvpP /home/ubuntu/benchmark /media/ubuntu/sdcard/home/ubuntu/
rsync -azvpP ~/rpmbuild/RPMS  -e 'dbclient -p 2222' root@vc709:/tmp/rpmbuild/
rsync -azvpP /home/ubuntu/benchmark/afl_test -e 'dbclient -p 2222' root@vc709:/tmp/benchmark/
rsync -azvpP /home/ubuntu/benchmark/asdf -e 'dbclient -p 2222' root@vc709:/tmp/benchmark/
```

## kernel
```
# mount sysroot
sudo mount -o loop sysroot.img ./sysroot
sudo sudo cp -r -p ../rootfs/* .
sudo umount ./sysroot
```
```
# copy opensbi
cd ~/riscv-linux
cp -p ./opensbi/build/platform/generic/firmware/fw_jump.bin ./

# modify uart
vim drivers/tty/serial/sifive.c
```
```
# strip
../find-dependency.sh
find ./ -name *.so.* | xargs ls -lh
find ./ -name *.so.* | xargs riscv64-unknown-linux-gnu-strip
find ./ -name *.so.* | xargs ls -lh
```

```
# sorted by time
ls -ltrh

#!/bin/bash
# run on vc709
cd ~/riscv-linux
cp -p ./linux/arch/riscv/boot/Image ./
cat start-kernel.sh
cat start-ppp.sh
sudo ./start-kernel.sh chipyard.fpga.vc709.VC709FPGATestHarness.RocketVC709Config 0

cd ~/riscv-linux
cp -p ./linux/arch/riscv/boot/Image ./
ls -lh ~/linux/arch/riscv/boot/Image
cat start-kernel.sh
cat start-ppp.sh
sudo ./start-kernel.sh chipyard.fpga.vc709.VC709FPGATestHarness.BoomVC709Config

# run on qemu
cd $ROOTFS
find . | cpio -c -o -v |gzip -9 -n >../rootfs.img
```
```
## nfs
sudo apt-get install nfs-kernel-server
sudo apt-get install nfs-common
sudo vim /etc/exports
sudo exportfs -rv
/nfsroot 10.0.5.2/24(rw,sync,no_subtree_check)
service nfs-kernel-server restart

sudo tcpdump -n -i ppp0

# ssh forwarding
ssh -NTf -R 11111:10.0.5.2:22 ubuntu@10.10.72.159

# sftp
sftp -P 22 sftp_kiki@10.0.5.2

[kiki@vc709 mibench]#mkdir /nfsroot/mibench
[kiki@vc709 mibench]#scp /mnt/nfs/home/riscv-linux/benchmark/mibench/runmibench.tar.gz /nfsroot/
[kiki@vc709 mibench]#scp /mnt/nfs/home/riscv-linux/benchmark/mibench/runme.sh /nfsroot/mibench/
[kiki@vc709 mibench]#cd  /nfsroot/mibench
[kiki@vc709 mibench]#./runme.sh 
real	8m 4.14s
user	7m 24.95s
sys	    0m 39.12s
[kiki@vc709 mibench]#
[kiki@vc709 ~]#cp /mnt/nfs/home/riscv-linux/benchmark/riscv-coremark/coremark.riscv ./
[kiki@vc709 ~]#ll
total 148
-rwx------    1 kiki     kiki        151496 Jan  1 03:58 coremark.riscv
[kiki@vc709 ~]#./coremark.riscv 

```
```
#
ls -l $USB_DEVICE
sudo usermod -a -G dialout ubuntu

$ sudo ls /sys/kernel/debug/usb/
$ sudo modprobe usbmon
$ tcpdump -D
$ sudo tcpdump -i usbmon2 -w ~/usb.pcap
$ sudo apt install wireshark-qt
$ lsusb
$ wireshark ~/usb.pcap
$ sudo wireshark
$ usb.device_address == 14
```

### 压缩选项
| alg    | kernel size (byts) | Time |
| :---   | :---:        | :---: |
| gzip   | 40698560 | |
| bzip2  | 38601408 | |
| lzma   | 26018496 | |
| xz     | 32309952 |  |
| lzo    | 44892864 | |
| lz4    | 44892864 | |
| zstd   | 32309952 |


###
sdcard
```
[root@vc709 x86_64]#time rpm -i libgcrypt-1.8.8-1.x86_64.rpm
0.05user 1.30system 11:40.92elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps
```
tmpfs
```
[root@vc709 x86_64]#time rpm -i gzip-1.10-1.x86_64.rpm 
0.03user 0.54system 0:15.63elapsed 3%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps
[root@vc709 x86_64]#time rpm -i libksba-1.6.0-1.x86_64.rpm 
0.03user 0.51system 0:02.57elapsed 21%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps
[root@vc709 x86_64]#
[root@vc709 x86_64]#time rpm -i libassuan-2.5.5-1.x86_64.rpm 
0.02user 0.36system 0:01.47elapsed 25%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps
[root@vc709 x86_64]#
[root@vc709 x86_64]#time rpm -i ntbtls-0.2.0-1.x86_64.rpm 
0.03user 0.24system 0:01.13elapsed 23%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps

[root@vc709 x86_64]#ls -lh npth-1.6-1.x86_64.rpm 
-rw-------    1 ubuntu   ubuntu     39.0K Sep  4 10:29 npth-1.6-1.x86_64.rpm
[root@vc709 x86_64]#time rpm -i npth-1.6-1.x86_64.rpm 
0.02user 0.15system 0:42.56elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps

[root@vc709 x86_64]#ls -lh gpgme-1.16.0-1.x86_64.rpm 
-rw-------    1 ubuntu   ubuntu      2.8M Sep  4 10:30 gpgme-1.16.0-1.x86_64.rpm
[root@vc709 x86_64]#time rpm -i gpgme-1.16.0-1.x86_64.rpm
0.14user 2.70system 0:17.61elapsed 16%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps

[root@vc709 x86_64]#ls -lh scute-1.7.0-1.x86_64.rpm 
-rw-------    1 ubuntu   ubuntu    173.5K Sep  4 10:31 scute-1.7.0-1.x86_64.rpm
[root@vc709 x86_64]#time rpm -i scute-1.7.0-1.x86_64.rpm 
0.01user 0.21system 0:01.13elapsed 19%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps

[root@vc709 x86_64]#ls -lh gnupg-2.2.29-1.x86_64.rpm 
-rw-------    1 ubuntu   ubuntu     11.3M Sep  4 10:34 gnupg-2.2.29-1.x86_64.rpm
[root@vc709 x86_64]#time rpm -i gnupg-2.2.29-1.x86_64.rpm 
0.53user 8.79system 36:58.06elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps

[root@vc709 x86_64]#lh curl-7.78.0-1.x86_64.rpm
-rw-------    1 ubuntu   ubuntu      1.3M Sep  4 10:50 curl-7.78.0-1.x86_64.rpm
[root@vc709 x86_64]#time rpm -i curl-7.78.0-1.x86_64.rpm
2.11user 7.51system 0:16.18elapsed 59%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps

[root@vc709 x86_64]#lh libgsasl-1.10.0-1.x86_64.rpm 
-rw-------    1 ubuntu   ubuntu      1.1M Sep  4 12:00 libgsasl-1.10.0-1.x86_64.rpm
[root@vc709 x86_64]#time rpm -i libgsasl-1.10.0-1.x86_64.rpm 
0.15user 1.83system 4:12.82elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps

[root@vc709 x86_64]#lh c-ares-1.17.2-1.x86_64.rpm
-rw-------    1 ubuntu   ubuntu    170.2K Sep  4 10:34 c-ares-1.17.2-1.x86_64.rpm
[root@vc709 x86_64]#time rpm -i c-ares-1.17.2-1.x86_64.rpm
0.14user 1.08system 3:05.10elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps

[root@vc709 x86_64]#lh attr-2.4.47-1.x86_64.rpm 
-rw-------    1 ubuntu   ubuntu    133.8K Sep  4 10:25 attr-2.4.47-1.x86_64.rpm
[root@vc709 x86_64]#time rpm -i attr-2.4.47-1.x86_64.rpm 
0.17user 0.93system 1:11.29elapsed 1%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps

[root@vc709 x86_64]#lh guile-3.0.1-1.x86_64.rpm 
-rwxr-xr-x    1 root     root       19.4M Sep 14  2021 guile-3.0.1-1.x86_64.rpm
[root@vc709 x86_64]#time rpm -i guile-3.0.1-1.x86_64.rpm 
real	13m 44.46s
user	0m 7.31s
sys	0m 43.27s

[root@vc709 x86_64]#time rpm -i time-1.9-1.x86_64.rpm 
real	0m 8.03s
user	0m 0.03s
sys	0m 0.12s
[root@vc709 x86_64]#lh time-1.9-1.x86_64.rpm 
-rwxr-xr-x    1 root     root       51.5K Aug 19 03:49 time-1.9-1.x86_64.rpm

[root@vc709 x86_64]#lh libtool-2.4.6-1.x86_64.rpm 
-rwxr-xr-x    1 root     root      838.9K Aug 10 22:41 libtool-2.4.6-1.x86_64.rpm
[root@vc709 x86_64]#time -p rpm -i libtool-2.4.6-1.x86_64.rpm 
real 8.51
user 0.17
sys 1.83
[root@vc709 x86_64]#

[root@vc709 x86_64]#lh gdb-11.1-1.x86_64.rpm 
-rwxr-xr-x    1 root     root       71.8M Sep 14 11:16 gdb-11.1-1.x86_64.rpm
[root@vc709 x86_64]#time rpm -i gdb-11.1-1.x86_64.rpm 
real	38m 44.95s
user	0m 0.70s
sys	0m 47.32s

[root@vc709 x86_64]#lh rpm-4.16.1.3-1.x86_64.rpm 
-rwxr-xr-x    1 root     root        2.6M Sep 15 13:36 rpm-4.16.1.3-1.x86_64.rpm
  [root@vc709 x86_64]#time rpm -i rpm-4.16.1.3-1.x86_64.rpm 
real	2m 16.86s
user	0m 1.53s
sys	0m 6.56s

[root@vc709 x86_64]#lh glib-2.49.7-1.x86_64.rpm 
-rw-rw-r--    1 ubuntu   ubuntu      8.1M Sep 27 15:16 glib-2.49.7-1.x86_64.rpm
[root@vc709 x86_64]#time rpm -i glib-2.49.7-1.x86_64.rpm
real	8m 9.67s
user	0m 9.52s
sys	0m 26.10s

[root@vc709 x86_64]#lh bluez-5.61-1.x86_64.rpm 
-rw-rw-r--    1 ubuntu   ubuntu      4.7M Sep 27 15:18 bluez-5.61-1.x86_64.rpm
[root@vc709 x86_64]#cp bluez-5.61-1.x86_64.rpm /tmp/
[root@vc709 x86_64]#time rpm -i /tmp/bluez-5.61-1.x86_64.rpm 
real	0m 52.48s
user	0m 0.03s
sys	0m 3.60s

[root@vc709 rpms]#time rpm -i bluez-5.61-1.x86_64.rpm 
real	4m 27.37s
user	0m 0.21s
sys	0m 6.55s


[root@vc709 x86_64]#time cp dbus-1.7.0-1.x86_64.rpm /tmp/
real	1m 37.97s
user	0m 0.00s
sys	0m 1.10s
[root@vc709 x86_64]#time rpm -i dbus-1.7.0-1.x86_64.rpm 
real	1m 3.75s
user	0m 2.20s
sys	0m 13.13s

[root@vc709 rpms]#time rpm -i elfutils-0.185-1.x86_64.rpm 
real	4m 41.29s
user	0m 0.41s
sys	0m 14.68s
```


```
dbclient ubuntu@optiplex-5060 -p 2222
```
### SSH
```
[root@vc709 .ssh]#ssh-keygen -t ecdsa -P ""
[root@vc709 .ssh]#scp ~/.ssh/id_rsa.pub ubuntu@10.10.72.159:/home/ubuntu/
ubuntu@optiplex-5060:~$ cat ~/id_ecdsa.pub >> ~/.ssh/authorized_keys 
```
### TMPFS
```
rsync -azvpP ~/rpmbuild/RPMS  -e 'dbclient -p 2222' root@vc709:/tmp/
rsync -azvpP ~/benchmark/ -e 'dbclient -p 2222' root@vc709:/tmp/benchmark/
```

### 测试SD卡读写速度
```
echo 3> /proc/sys/vm/drop_caches
time dd if=/dev/mmcblk0 of=/dev/null bs=1M count=5 conv=sync
time dd bs=1M count=500 if=/dev/zero of=/mnt/aa
```

```
[root@vc709 ~]#time dd if=/dev/mmcblk0p2 of=/dev/null bs=1M count=1 conv=sync
1+0 records in
1+0 records out
1048576 bytes (1.0MB) copied, 28.215142 seconds, 36.3KB/s
0.00user 0.14system 0:28.28elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps
[root@vc709 ~]#

[root@vc709 ~]#time dd bs=1M count=1 if=/dev/zero of=/mnt/aa
1+0 records in
1+0 records out
1048576 bytes (1.0MB) copied, 0.759929 seconds, 1.3MB/s
0.00user 0.71system 0:00.81elapsed 87%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps
[root@vc709 ~]#

[root@vc709 ~]#time dd bs=1M count=50 if=/dev/zero of=/mnt/aaa
50+0 records in
50+0 records out
52428800 bytes (50.0MB) copied, 7.933754 seconds, 6.3MB/s
0.00user 7.02system 0:08.01elapsed 87%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps
[root@vc709 ~]#

```

### F2FS 
```
[root@vc709 ~]#iostat -k
Linux 5.14.0-rc6+ (vc709) 	01/01/70 	_riscv64_	(4 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.41    0.00    8.96   23.18    0.00   67.45

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
mmcblk0           3.41        51.05         0.64      21864        272
mmcblk0p2         3.39        50.96         0.64      21824        272

[root@vc709 ~]#time dd if=/dev/mmcblk0p2 of=/dev/null bs=1M count=1 conv=sync
1+0 records in
1+0 records out
1048576 bytes (1.0MB) copied, 15.355861 seconds, 66.7KB/s
0.00user 0.19system 0:15.42elapsed 1%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps

[root@vc709 ~]#time dd bs=1M count=1 if=/dev/zero of=/mnt/aa
1+0 records in
1+0 records out
1048576 bytes (1.0MB) copied, 13.097176 seconds, 78.2KB/s
0.00user 0.28system 0:13.15elapsed 2%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps

[root@vc709 ~]#time dd bs=1M count=50 if=/dev/zero of=/mnt/aaa
50+0 records in
50+0 records out
52428800 bytes (50.0MB) copied, 7.418460 seconds, 6.7MB/s
0.00user 7.44system 0:07.46elapsed 99%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps

```

#### SDHC
```

```

#### SDXC
```

```

### Sifive UART Driver
Then, we modify sifive uart driver
```
cd linux/
vim drivers/tty/serial/sifive.c
```
Then we modify following lines
```
#define SIFIVE_DEFAULT_BAUD_RATE                115200
#define SIFIVE_TX_FIFO_DEPTH                    8
#define SIFIVE_RX_FIFO_DEPTH                    8
```
and change above lines into following
```
#define SIFIVE_DEFAULT_BAUD_RATE                921600
#define SIFIVE_TX_FIFO_DEPTH                    1024
#define SIFIVE_RX_FIFO_DEPTH                    1024
```

### dropbear
```
/usr/sbin/dropbear -E -R -p 2222
test -e /root/.ssh/id_dropbear || dropbearkey -t ed25519 -f /root/.ssh/id_dropbear

```

### ntp-server
```
# build ntp and tzdb rpm packages
~/rpmbuild/SPECS$ ./run-spec.sh ntp-4.2.8p15.spec
~/rpmbuild/SPECS$ ./run-spec.sh tzdb-2021a.spec

# host side
$ sudo apt install -y ntp
$ service ntp-systemd-netif start
$ service ntp-systemd-netif status

# client side
$ cp /usr/share/zoneinfo/Asia/Shanghai $ROOTFS/etc/localtime
$ ntpdate $PEERNAME
```

### nfs-server
```
# host side
sudo apt install nfs-kernel-server nfs-common
sudo vim /etc/exports

  /nfsroot 10.0.5.2(rw,sync,no_wdelay,no_subtree_check,no_root_squash)
  /home/ubuntu 10.0.5.2(rw,sync,no_wdelay,no_subtree_check,no_root_squash)

sudo exportfs -rv
service nfs-kernel-server restart

# client side (/etc/ppp/ip-up)

NFS_ROOT=/mnt/nfs/root
NFS_HOME=/mnt/nfs/home

mount -t nfs -o nolock,rsize=65536,wsize=65536,tcp $IPREMOTE:/home/ubuntu $NFS_HOME
mount -t nfs -o nolock,rsize=65536,wsize=65536,tcp $IPREMOTE:/nfsroot     $NFS_ROOT
```

NFS Performace
```
[root@vc709 ~]#time dd if=/dev/zero of=$NFS_HOME/testfile.dat bs=8k count=1024
1024+0 records in
1024+0 records out
8388608 bytes (8.0MB) copied, 32.149532 seconds, 254.8KB/s
real	0m 32.17s
user	0m 0.01s
sys	0m 1.67s
[root@vc709 ~]#time dd of=/dev/null if=$NFS_HOME/testfile.dat bs=8k
1024+0 records in
1024+0 records out
8388608 bytes (8.0MB) copied, 29.926615 seconds, 273.7KB/s
real	0m 29.95s
user	0m 0.03s
sys	0m 1.16s
[root@vc709 ~]#
```

SPI performance
```
[root@vc709 ~]#time dd if=/dev/zero of=/testfile.dat bs=8k count=1024
1024+0 records in
1024+0 records out
8388608 bytes (8.0MB) copied, 1.522061 seconds, 5.3MB/s
0.03user 1.35system 0:01.57elapsed 87%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+0minor)pagefaults 0swaps

```

### rsync + inotify
```
# inotify-tools
sudo apt install inotify-tools

[root@vc709 ~]#uname -r
5.14.0-rc3
[root@vc709 ~]#ll /proc/sys/fs/inotify/*
-rw-r--r--    1 root     root             0 Jan  1 14:47 /proc/sys/fs/inotify/max_queued_events
-rw-r--r--    1 root     root             0 Jan  1 14:47 /proc/sys/fs/inotify/max_user_instances
-rw-r--r--    1 root     root             0 Jan  1 14:47 /proc/sys/fs/inotify/max_user_watches
[root@vc709 ~]#

# rsync
export USERNAME=ubuntu
export IPREMOTE=10.0.5.3

# sync rpm packages
rsync -azvP -e 'dbclient -y -p 2222' $USERNAME@$IPREMOTE:~/rpmbuild/RPMS /tmp/rpms

# sync libs
rsync -avzP -e 'dbclient -y -p 2222' $USERNAME@$IPREMOTE:~/sysroot/lib/            /lib/
rsync -avzP -e 'dbclient -y -p 2222' $USERNAME@$IPREMOTE:~/sysroot/usr/lib/        /usr/lib/

# sync rpm packages
rsync -avzP ~/rpmbuild/ -e ssh $USERNAME@IPREMOTE:~/rpmbuild/

# sync benchmarks
rsync -avzP -e ssh ubuntu@10.10.72.159:~/benchmark/riscv-coremark ~/benchmark/
rsync -avzP -e ssh ubuntu@10.10.72.159:~/benchmark/mibench ~/benchmark/

# backup benchmarks
rsync -avzp ~/benchmark/mibench/ --exclude=.git -e 'dbclient -y -p 2222' root@vc709:/tmp/benchmark/mibench/
rsync -avzP -e 'dbclient -y -p 2222' root@vc709:/tmp/benchmark/mibench/ ~/benchmark/mibench/
```