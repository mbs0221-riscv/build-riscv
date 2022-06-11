```
cd ~/linux
```
## Kernel Config
```
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/Kconfig
```
## Kernel API

### Kconfig
```
$ vim arch/riscv/Kconfig
```
### Control & Status Registers
```
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/include/asm/csr.h
```
`start_kernel()->setup_arch()->early_trap_init()->memcpy((void *)vectors, __vectors_start, __vectors_end - __vectors_start)`
```
ubuntu@optiplex-5060:~/riscv-linux/linux/arch/riscv$ cat ./kernel/head.S
ubuntu@optiplex-5060:~/riscv-linux/linux/arch/riscv$ cat ./kernel/setup.c
```
### SBI
```
arch/riscv/include/asm/sbi.h
```

### Syscall
```
ubuntu@optiplex-5060:~/riscv-linux$ vim linux/arch/riscv/kernel/syscall_table.c 
ubuntu@optiplex-5060:~/riscv-linux$ vim linux/arch/riscv/include/asm/unistd.h
ubuntu@optiplex-5060:~/riscv-linux$ vim linux/arch/riscv/include/uapi/asm/unistd.h 
ubuntu@optiplex-5060:~/riscv-linux$ vim linux/include/uapi/asm-generic/unistd.h 
```

### Memory Management
```
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/include/asm/mman.h
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/include/asm/mmu.h
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/include/asm/mmu_context.h
```
### Page Table
```
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/include/asm/pgtable-64.h
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/include/asm/pgtable-bits.h
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/include/asm/pgtable.h
```
### Protection Keys
```
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/include/asm/pkeys-defines.h
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/include/asm/pkeys.h
```
### Process
```
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/include/asm/processor.h
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/include/asm/ptrace.h
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/include/asm/switch_to.h
```
## User API

### hw captions
```
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/include/uapi/asm/hwcap.h
```

### Memory Management
```
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/include/uapi/asm/mman.h
```

### Control & Status Registers
```
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/include/uapi/asm/ptrace.h
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/kernel/asm-offsets.c
```

### CPU ISA
```
ubuntu@optiplex-5060:~/linux$ vim vim arch/riscv/kernel/cpufeature.c
```

### Kernel
```
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/kernel/entry.S
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/kernel/process.c
```
add following lines
```
        /*
         * Set the branch context register to 0, so that disable BCS in interrupt handling.
         *
         */
        csrw CSR_BCS, x0
        csrw CSR_BCSBASE, x0
        csrw CSR_BCSEND, x0
        csrw CSR_BCSCFG, x0
        csrw CSR_BCSADDR, x0
```
### Context Switch
```
$ ./arch/riscv/include/asm/switch_to.h
ubuntu@optiplex-5060:~/riscv-linux$ vim linux/include/asm-generic/switch_to.h
```

### Memory Management
```
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/mm/Makefile
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/mm/cacheflush.c
ubuntu@optiplex-5060:~/linux$ vim arch/riscv/mm/pkeys.c
ubuntu@optiplex-5060:~/linux$ vim fs/proc/task_mmu.c
ubuntu@optiplex-5060:~/linux$ vim include/linux/mm.h
```

[进程切换分析(1)：基本框架](http://www.wowotech.net/process_management/context-switch-arch.html)

schedule() --> context_switch() --> switch_to --> __switch_to()

```
vim kernel/sched/core.c
```
