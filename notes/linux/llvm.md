# LLVM
## llvm
install
```
$ sudo apt install llvm-11-*
$ sudo apt install lld-11
```

## llvm-project
```
$ git clone https://github.com/llvm/llvm-project.git
$ cd llvm-project $ mkdir build && cd build
$ cmake -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DLLVM_ENABLE_PROJECTS="libcxx;libcxxabi" ../llvm
$ make                            # Build
$ make check-cxx                  # Test
$ make install-cxx install-cxxabi # Install
```

build llvm-project
```
$ mkdir build
$ cmake -S llvm -B build -G Ninja -DLLVM_ENABLE_PROJECTS="clang;lld;lldb;llvm;openmp;libcxx;libcxxabi" -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=RISCV
$ cmake --build build
```

compiler-rt
```
$ mkdir build-compiler-rt
$ cd build-compiler-rt/
$ cmake ../compiler-rt -DLLVM_CONFIG_PATH=llvm-config
$ make
```
### LLVM Backend
#### RISCV Target
```
$ cd llvm-project/llvm/lib/Target/RISCV
```
`RISCV.td` - Describe the RISCV Target Machine
File Name | Description
|  :----  | :----  |
`RISCV.td` | Describe the RISCV Target Machine
`RISCVSystemOperands.td` | This file defines the symbolic operands permitted for various kinds of RISC-V system instruction.
`RISCVSchedule.td` | RISCV Scheduling Definitions.
`RISCVRegisterInfo.td` | RISC-V Register defs.
`RISCVCallingConv.td` | Calling Conventions RISCV.
`RISCVInstrInfo.td` | Target Description for RISCV.
`RISCVRegisterBank.td` | Describe the RISCV Banks.
`RISCVSchedRocket.td` | Rocket Scheduling Definitions.
`RISCVSchedSiFive7.td` | SiFive7 Scheduling Definitions.

`RISCVInstrInfo.td` - This file describes the RISC-V instructions in TableGen format.
File Name | Description
|  :----  | :----  |
`RISCVInstrInfoM.td` | RISC-V 'M' instructions.
`RISCVInstrInfoA.td` | RISC-V 'A' instructions.
`RISCVInstrInfoF.td` | RISC-V 'F' instructions.
`RISCVInstrInfoD.td` | RISC-V 'D' instructions.
`RISCVInstrInfoC.td` | Compressed RISCV instructions.
`RISCVInstrInfoB.td` | RISC-V 'B' instructions.
`RISCVInstrInfoZfh.td` | V 'FH' instructions.
`RISCVInstrInfoV.td` | RISC-V 'V' instructions.
`RISCVInstrInfoVPseudos.td` | RISC-V 'V' Pseudos.
`RISCVInstrInfoVSDPatterns.td` | RVV SDNode patterns.


## llvm-objdump
```
$ llvm-objdump --version | grep riscv
```
反汇编`hello.o`
```
$ llvm-objdump -h hello.o
$ llvm-objdump -d hello.o
$ llvm-objdump -d hello
```
链接
```
$ ld.lld hello.o -o hello
```
查看可执行文件格式
```
$ file hello.o
hello.o: ELF 64-bit LSB relocatable, UCB RISC-V, version 1 (SYSV), not stripped
```






## llvm-pass
```
CC=clang 
OBJDUMP=$(TARGET)-objdump
TARGET=riscv64-unknown-linux-gnu
MARCH=rv64gc

CFLAGS=--gcc-toolchain=$(TOOLCHAIN) --sysroot=$(SYSROOT) --target=$(TARGET) -march=$(MARCH) -v

rtlib.o : rtlib.c
        $(CC) $(CFLAGS) -O -c $< -o $@

bcslib.o : bcslib.c
        $(CC) $(CFLAGS) -O -c $< -o $@

example.o : example.c
        $(CC) $(CFLAGS) -Xclang -load -Xclang build/skeleton/libSkeletonPass.so -c $< -o $@

example : example.o rtlib.o bcslib.o
        $(CC) $(CFLAGS) -o $@ $+
        $(OBJDUMP) -d $@ > example.asm
        
clean:
        rm *.o example
```

经过LLVM插桩的riscv目标文件，经过gcc交叉编译后，能在板子上跑起来。
~~~
PATH=$(RISCV)/riscv64-unknown-elf/include

LIBRARY_PATH=$(RISCV)/lib/gcc/riscv64-unknown-elf/9.2.0/:/home/ubuntu/chipyard/riscv-tools-install/lib/gcc/riscv64-unknown-elf/9.2.0/../../../../riscv64-unknown-elf/lib/:/home/ubuntu/chipyard/riscv-tools-install/riscv64-unknown-elf/lib/

PATH=/usr/riscv64-linux-gnu/include

LIBRARY_PATH=/usr/lib/gcc-cross/riscv64-linux-gnu/10
~~~

##
Writing an LLVM Pass (https://freecompilercamp.org/llvm-pass/)
```
 $  cd $LLVM_SRC/llvm/lib/Transforms
 $  mkdir FunctionsNames
 $  cd FunctionsNames
 $  cat <<EOF > CMakeLists.txt
add_llvm_library( LLVMFunctionsNames MODULE
  FunctionsNames.cpp

  PLUGIN_TOOL
  opt
  )
EOF

 $  echo "add_subdirectory(FunctionsNames)" >> ../CMakeLists.txt
 $  vim FunctionsNames.cpp
```
```
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/IR/Instructions.h"

using namespace llvm;

namespace {
  //struct FunctionsNames : public FunctionPass {
  class FunctionsNames : public FunctionPass {
  public:
    static char ID;
    FunctionsNames() : FunctionPass(ID) {}

    bool runOnFunction(Function &F) override {
      // Print name of function
      outs() << "*";
      outs().write_escaped(F.getName()) << '\n'; 

      for (auto& B : F) {    // Iterate over each Basic Blocks in Functions
        for (auto& I : B) {  // Iterate over each Instructions in Basic Blocks
          // Dynamically cast Instruction to CallInst. 
          // This step will return false for any instruction which is 
          // not a CallInst
          if(CallInst *CI = dyn_cast<CallInst>(&I)) {
            // Print out the function name
            outs() << " |-" << CI->getCalledFunction()->getName() << "\n";
          }
        }
      }
      return false;
    }
  }; // end of struct FunctionsNames
}  // end of anonymous namespace

char FunctionsNames::ID = 0;
static RegisterPass<FunctionsNames> X("func-names", "Display Function Names",
    false /* Only looks at CFG */,
    false /* Analysis Pass */);

static RegisterStandardPasses Y(
    PassManagerBuilder::EP_EarlyAsPossible,
    [](const PassManagerBuilder &Builder,
      legacy::PassManagerBase &PM) { PM.add(new FunctionsNames()); });

```
```
$ cd $LLVM_BUILD
$ ninja -j12
[10/10] Linking CXX shared module lib/LLVMFunctionsNames.so
$ ./bin/opt -disable-output  -load lib/LLVMFunctionsNames.so -func-names < test.bc
```

## clang
编译`hello.c`生成汇编文件`hello.S`，再汇编`hello.S`生成目标文件`hello.o`
```
$ clang -target riscv64 -march=rv64gc -S hello.c -o hello.S
$ clang --target=riscv64 -march=rv64gc hello.S -c -o hello.o
```
编译`hello.c`生成目标文件`hello.o`
```
$ clang --target=riscv64 -march=rv64gc -O -c hello.c
```
编译`hello.c`生成可执行文件`hello`
```
$ clang --target=riscv64 -march=rv64gc hello.c -o hello
```
用gcc编译`hello.o`生成可执行文件`hello`
```
$ riscv64-unknown-elf-gcc hello.o -o hello
```
用gcc编译的时间 v.s. 用clang+gcc编译的时间
```
$ time riscv64-unknown-elf-gcc -O3 -march=rv64gc -o hello hello.c

real	0m0.022s
user	0m0.016s
sys	    0m0.007s
$ time clang-10 -O -c --target=riscv64-unknown-elf hello.c -march=rv64gc -O3 && riscv64-unknown-elf-gcc hello.o -o hello -march=rv64gc -O3

real	0m0.047s
user	0m0.026s
sys	    0m0.005s
```

### -O优化选项
* Os enables all 02 optimizations except those that often increase code size.
* O0 reduces compilation time and makes debugging produce the expected results (default compiler setting).
* O1 enables code size and execution time reduction, without performing any optimizations that take a great deal of compilation time.
* O2 enables nearly all supported optimizations that do not involve a space-speed tradeoff. As compared to 00, this option increases both compilation time and the performance of the generated code.
* O3 turns on all optimizations specified by 02 and also turns on more optimizations that have an impact on execution time.

### Example 
Clang -- Basics of compilation (http://freecompilercamp.org/clang-basics/)
```
$ cat << EOF > hello_world.c
#include <stdio.h>


#define STR "Hello World"


/* Multi-line Comment - 
 * Starting main function here
 */
int main()
{
  // Printing Hello World
  printf("%s\n", STR);
  return 0;
}
EOF

$ vim hello_world.c 
$ clang -E hello_world.c > hello_world.i
$ vi hello_world.i
$ clang -fsyntax-only hello_world.c
$ clang -cc1 -ast-dump hello_world.c
$ clang -S -emit-llvm hello_world.c
$ vi hello_world.ll
$ opt -print-function < hello_world.ll
$ llc hello_world.ll -march=x86-64 -o hello_world.s
$ clang hello_world.c -c -o hello_world.o
$ clang hello_world.s -Wall -o hello_world
$ ./hello_world
```

`test.c` -- clang --> `test.ll` -- llvm-as --> `test.bc` -- llc --> `test.s`

`test.bc` -- llvm-dis --> `test.ll`


## References
[Articles in tag "Compilation"](https://eli.thegreenplace.net/tag/compilation)

[UG3 COMPILING TECHNIQUES 2019/2020](https://www.inf.ed.ac.uk/teaching/courses/ct/19-20/)

[CS 6120: Advanced Compilers β](https://www.cs.cornell.edu/courses/cs6120/2019fa/)

[Free Compiler Camp](http://freecompilercamp.org/)

[Tutorials for Clang/LLVM](http://freecompilercamp.org/clang-llvm-landing/)

[Getting started with LLVM](https://www.cs.utexas.edu/~pingali/CS380C/2020/assignments/llvm-guide.html)

[LLVM’s Analysis and Transform Passes](https://releases.llvm.org/8.0.0/docs/Passes.html)

[Add basic loop fusion pass.](https://reviews.llvm.org/rG3cdf87940f05a66b8051ce3803c7cfbc91c108ce)

[LLVM for Grad Students](https://www.cs.cornell.edu/~asampson/blog/llvm.html)

[Instrumentation Pass for LLVM](https://github.com/imdea-software/LLVM_Instrumentation_Pass)

[Articles in tag "LLVM & Clang"](https://eli.thegreenplace.net/tag/llvm-clang)

[Writing LLVM Pass in 2018 — Preface](https://medium.com/@mshockwave/writing-llvm-pass-in-2018-preface-6b90fa67ae82)

[llvm Category](https://www.leadroyal.cn/categories/llvm/)

[llvm-tutor](https://github.com/banach-space/llvm-tutor)

[clang-tutor](https://github.com/banach-space/clang-tutor)

[LLVM Inline Asm Support](http://nondot.org/~sabre/LLVMNotes/InlineAsm.txt)

[[llvm-dev] Continuing: How to write a custom LTO pass?](https://lists.llvm.org/pipermail/llvm-dev/2017-August/116172.html)
