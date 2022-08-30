# RISC-V
### 工具链
* opcodes
```
$ cd riscv-tools
$ vim riscv-opcodes/opcodes
qihao   rd rs1 rs2 31..25=0  14..12=0 6..2=0x15 1..0=3
$ make install
```
* 添加指令
```
$ vim riscv-gnu-toolchain/riscv-binutils-gdb/include/opcode/riscv-opc.h
#define MATCH_QIHAO 0x57
#define MASK_QIHAO  0xfe00707f
DECLARE_INSN(qihao, MATCH_QIHAO, MASK_QIHAO)

#define DECLARE_INSN(INSN_NAME, INSN_MATCH, INSN_MASK) \
static inline bool is_ ## INSN_NAME ## _insn (long insn) \
{ \
  return (insn & INSN_MASK) == INSN_MATCH; \
}
```
### spike
* 编译
```
$ vim rocket-chip/riscv-tools/riscv-isa-sim/riscv/insns/qihao.h
WRITE_RD(sext_xlen(~(RS1 ^ RS2)));
$ vim rocket-chip/riscv-tools/riscv-isa-sim/riscv/riscv.mk.in
riscv_insn_list = \
	qihao \
$ cd rocket-chip/riscv-tools/
$ ./build.sh
```
* 测试
```
#include<stdio.h>

int main() {
    int res = 0;
    __asm__ __volatile__("li a2, 0x00ff");
    __asm__ __volatile__("li a3, 0x0f0f");
    __asm__ __volatile__("qihao %0, a2, a3":"=r"(res)); // 0xfffff00f
    printf("%x\n", res);
    return 0;
}
```

————————————————

版权声明：本文为CSDN博主「齐豪」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。

原文链接：https://blog.csdn.net/qq_33096883/article/details/83476656

### riscv-gnu-toolchain
```
$ cd ~/chipyard/toolchains/riscv-tools/riscv-gnu-toolchain
$ cd  riscv-binutils
$ vim include/opcode/riscv-opc.h
$ vim opcodes/riscv-opc.c
```
* objdump
```
$ riscv64-unknown-elf-objdump -f hello.riscv
$ riscv64-unknown-elf-objdump -h hello.riscv
```

```
$ riscv32-unknown-elf-objcopy XXX.elf -O binary XXX.bin
$ dd if=XXX.bin of=XXX.img bs=128 count=3
```
### spike simulator
Adding the custom instruction to spike ISA simulator
```
$ cd ~/chipyard/toolchains/riscv-tools/riscv-isa-sim
$ vim /riscv/encoding.h
$ vim riscv-isa-sim/riscv/insns/mod.h
$ vim riscv-isa-sim/riscv/riscv.mk.in
$ vim riscv-isa-sim/spike_main/disasm.cc
```
### gem5 simulator
Installing gem5
```
$ sudo apt install python-six
$ sudo apt-get install libboost-all-dev
$ sudo apt install mercurial
$ hg clone http://repo.gem5.org/gem5
$ cd gem5
$ scons build/RISCV/gem5.opt
$ build/RISCV/gem5.opt configs/example/se.py -c tests/test-progs/hello/bin/riscv/linux/hello
$ riscv64-unknown-elf-gcc -o hello hello.c -static
$ build/RISCV/gem5.opt configs/example/se.py -c hello
```
Adding the new instruction to gem5
```
$ cd src/arch/riscv/isa
$ vim decoder.isa
```

