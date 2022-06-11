obj-m:=kprobe_custom.o
obj-m+=gcd.o
obj-m+=hello.o
#obj-m+=hello_proc.o
#obj-m+=sysfilter.o

ROOTFS:=/media/ubuntu/sdcard
CURRENT_PATH:=$(shell pwd)
LINUX_KERNEL_PATH:=~/linux #$(ROOTFS)/lib/modules/5.14.0-rc6+/build

all:
	make -C $(LINUX_KERNEL_PATH) M=$(CURRENT_PATH) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- modules
clean:
	make -C $(LINUX_KERNEL_PATH) M=$(CURRENT_PATH) clean
modules_install: 
	make -C $(LINUX_KERNEL_PATH) M=$(CURRENT_PATH) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- modules_install -j12
