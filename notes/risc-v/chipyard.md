# chipyard
## hardware flow
FPGA板子switch设置：

| switch | cpu core   | config            |
| :---   | :---       | :---              |
| 00010  | boom       | BoomVC709Config   |
| 11010  | rocketcore | RocketVC709Config |

### ucb-bar/chipyard
#### Sifive UART
In `fpga/src/main/scala/vc709/Configs.scala`, we add following line
```
case PeripheryUARTKey => List(UARTParams(address = BigInt(0x64000000L), baudRate=921600, nTxEntries = 1024, nRxEntries = 1024))
```

```
$ CONFIG=RocketVC709Config ./hardware.sh
$ CONFIG=BoomVC709Config ./hardware.sh
```

```
$ cd ~/chipyard/fpga/
$ make -j12 SUB_PROJECT=vc709 CONFIG=RocketVC709Config mcs
$ make -j12 SUB_PROJECT=vc709 CONFIG=BoomVC709Config mcs
```

```
$ cd ~/riscv-linux/
$ ./move.sh
$ sudo ./start-kernel.sh ./builds/chipyard.fpga.vc709.VC709FPGATestHarness.BoomVC709Config.dtb
```

### sifive/freedom
```
# copy from sifive/freedom
build_dir=/home/ubuntu/freedom/builds/vc709-u500devkit
U500DevKitConfig=sifive.freedom.unleashed.DevKitU500FPGADesign_WithDevKit50MHz

# build project
cd ~/riscv-linux/
CONFIG=RocketVC709Config ./hardware.sh

scp -p ubuntu@10.10.72.155:$build_dir/$U500DevKitConfig.dtb $BUILDS
scp -p ubuntu@10.10.72.155:$build_dir/$U500DevKitConfig.dts $BUILDS
scp -p ubuntu@10.10.72.155:$build_dir/obj/VC709PCIeShell.mcs $BUILDS
scp -p ubuntu@10.10.72.155:$build_dir/obj/VC709PCIeShell.prm $BUILDS
```

```
INFO: [Route 35-20] Post Routing Timing Summary | WNS=0.094  | TNS=0.000  | WHS=0.018  | THS=0.000  |
Phase 11 Post Router Timing
INFO: [Route 35-20] Post Routing Timing Summary | WNS=0.135  | TNS=0.000  | WHS=0.011  | THS=0.000  |
```

## Sha3 RoCC
```
[root@vc709 linux]#cd ~/chipyard/generators/sha3/software/tests/linux
[root@vc709 linux]#./sha3-rocc.riscv 
Start basic test 1.
output[0]:203 ==? results[0]:203 
output[1]:52 ==? results[1]:52 
output[2]:27 ==? results[2]:27 
output[3]:85 ==? results[3]:85 
output[4]:46 ==? results[4]:46 
output[5]:79 ==? results[5]:79 
output[6]:152 ==? results[6]:152 
output[7]:228 ==? results[7]:228 
output[8]:86 ==? results[8]:86 
output[9]:138 ==? results[9]:138 
output[10]:201 ==? results[10]:201 
output[11]:206 ==? results[11]:206 
output[12]:253 ==? results[12]:253 
output[13]:168 ==? results[13]:168 
output[14]:255 ==? results[14]:255 
output[15]:107 ==? results[15]:107 
output[16]:122 ==? results[16]:122 
output[17]:177 ==? results[17]:177 
output[18]:65 ==? results[18]:65 
output[19]:68 ==? results[19]:68 
output[20]:231 ==? results[20]:231 
output[21]:19 ==? results[21]:19 
output[22]:70 ==? results[22]:70 
output[23]:198 ==? results[23]:198 
output[24]:64 ==? results[24]:64 
output[25]:90 ==? results[25]:90 
output[26]:192 ==? results[26]:192 
output[27]:80 ==? results[27]:80 
output[28]:206 ==? results[28]:206 
output[29]:234 ==? results[29]:234 
output[30]:168 ==? results[30]:168 
output[31]:159 ==? results[31]:159 
Success!
SHA execution took 325 cycles
[root@vc709 linux]#./sha3-sw.riscv 
Start basic test 1.
output[0]:203 ==? results[0]:203 
output[1]:52 ==? results[1]:52 
output[2]:27 ==? results[2]:27 
output[3]:85 ==? results[3]:85 
output[4]:46 ==? results[4]:46 
output[5]:79 ==? results[5]:79 
output[6]:152 ==? results[6]:152 
output[7]:228 ==? results[7]:228 
output[8]:86 ==? results[8]:86 
output[9]:138 ==? results[9]:138 
output[10]:201 ==? results[10]:201 
output[11]:206 ==? results[11]:206 
output[12]:253 ==? results[12]:253 
output[13]:168 ==? results[13]:168 
output[14]:255 ==? results[14]:255 
output[15]:107 ==? results[15]:107 
output[16]:122 ==? results[16]:122 
output[17]:177 ==? results[17]:177 
output[18]:65 ==? results[18]:65 
output[19]:68 ==? results[19]:68 
output[20]:231 ==? results[20]:231 
output[21]:19 ==? results[21]:19 
output[22]:70 ==? results[22]:70 
output[23]:198 ==? results[23]:198 
output[24]:64 ==? results[24]:64 
output[25]:90 ==? results[25]:90 
output[26]:192 ==? results[26]:192 
output[27]:80 ==? results[27]:80 
output[28]:206 ==? results[28]:206 
output[29]:234 ==? results[29]:234 
output[30]:168 ==? results[30]:168 
output[31]:159 ==? results[31]:159 
Success!
SHA execution took 158670 cycles
[root@vc709 linux]#
```