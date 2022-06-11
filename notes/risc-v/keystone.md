# grub
```
grub> set root='hd1,gpt3'
grub> search --no-floppy --fs-uuid --set=root 17971e4e-56a3-4acc-917c-6501f2353d04
grub> linux /vmlinuz-5.14.16-101.0.riscv64.fc33.riscv64 earlycon=sbi console=ttySIF0,921600 root=UUID=1abf5c6d-3827-4beb-8b8b-3d39e5e14d6d
grub> devicetree /dtb-5.14.16-101.0.riscv64.fc33.riscv64/rocketchip/rocketchip-vc709.dtb
grub> initrd /initramfs-5.14.16-101.0.riscv64.fc33.riscv64.img
```

```
GRUB2 输出到串口 ttyS0
可以配置GRUB2输出到串口 修改 /etc/default/grub

这是OS的输出
GRUB_CMDLINE_LINUX_DEFAULT="console=ttySIF0 console=ttySIF0,921600"

这是GRUB自己的
## Serial console 
GRUB_TERMINAL=serial 
GRUB_SERIAL_COMMAND="serial --speed=921600 --unit=0 --word=8 --parity=no --stop=1"
```
# keystone
```
ubuntu@optiplex-5060:~/keystone/build$ cmake .. -DLINUX_SIFIVE=FALSE -DLINUX_VC709=TRUE
ubuntu@optiplex-5060:~/keystone/build$ cmake .. -DLINUX_SIFIVE=FALSE -DLINUX_VC709=TRUE -DSM_PLATFORM=thead/c910
ubuntu@optiplex-5060:~/keystone/build$ make linux
ubuntu@optiplex-5060:~/keystone/build$ make sm
ubuntu@optiplex-5060:~/keystone/build$ make driver
ubuntu@optiplex-5060:~/keystone/build$ make tests
```
# keystone-demo
```
ubuntu@optiplex-5060:~/keystone/sm$ git checkout master
ubuntu@optiplex-5060:~/keystone/sm/tools$ make hash
ubuntu@optiplex-5060:~/keystone-demo$ SM_HASH=~/keystone/sm/tools/sm_expected_hash.h ./quick-start.sh
```

# opendla
```
ubuntu@optiplex-5060:~/chipyard/software/nvdla-workload/nvdla-base$ make LINUXSRC=$FIREMARSHAL_LINUX_SRC O=~/keystone/build/linux.build
ubuntu@optiplex-5060:~/chipyard/software/nvdla-workload/nvdla-base/nvdla-sw/prebuilt/x86-ubuntu$ ./nvdla_compiler -o loadables --profile basic --cprecision int8 --configtarget opendla-small --batch 32 -o loadables --prototxt /home/ubuntu/nvdla_loadables/resnet18-imagenet-caffe/Resnet50/ResNet-50-deploy.prototxt --caffemodel /home/ubuntu/nvdla_loadables/resnet18-imagenet-caffe/Resnet50/ResNet-50-model.caffemodel --informat nhwc
```

# keyedge
```
ubuntu@optiplex-5060:~/keyedge$ make
ubuntu@optiplex-5060:~/keyedge$ echo $KEYEDGE_DIR
```