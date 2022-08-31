```
cd ~/linux
```

## Kernel Config

```
arch/riscv/Kconfig
```

## Kernel API

### Kconfig

```
arch/riscv/Kconfig
```

### Control & Status Registers

```
arch/riscv/include/asm/csr.h
```

`start_kernel()->setup_arch()->early_trap_init()->memcpy((void *)vectors, __vectors_start, __vectors_end - __vectors_start)`

```
arch/riscv/kernel/head.S
arch/riscv/kernel/setup.c
```

### SBI

```
arch/riscv/include/asm/sbi.h
```

### Syscall

```
arch/riscv/kernel/syscall_table.c 
arch/riscv/include/asm/unistd.h
arch/riscv/include/uapi/asm/unistd.h 
include/uapi/asm-generic/unistd.h 
```

### Memory Management

```
arch/riscv/include/asm/mman.h
arch/riscv/include/asm/mmu.h
arch/riscv/include/asm/mmu_context.h
```

### Page Table

```
arch/riscv/include/asm/pgtable-64.h
arch/riscv/include/asm/pgtable-bits.h
arch/riscv/include/asm/pgtable.h
```

### Protection Keys

```
arch/riscv/include/asm/pkeys-defines.h
arch/riscv/include/asm/pkeys.h
```

### Process

```
arch/riscv/include/asm/processor.h
arch/riscv/include/asm/ptrace.h
arch/riscv/include/asm/switch_to.h
```

## User API

### hw captions

```
arch/riscv/include/uapi/asm/hwcap.h
```

### Memory Management

```
arch/riscv/include/uapi/asm/mman.h
```

### Control & Status Registers

```
arch/riscv/include/uapi/asm/ptrace.h
arch/riscv/kernel/asm-offsets.c
```

### CPU ISA

```
vim arch/riscv/kernel/cpufeature.c
```

### Kernel

```
arch/riscv/kernel/entry.S
arch/riscv/kernel/process.c
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
arch/riscv/mm/Makefile
arch/riscv/mm/cacheflush.c
arch/riscv/mm/pkeys.c
fs/proc/task_mmu.c
include/linux/mm.h
```

[进程切换分析(1)：基本框架](http://www.wowotech.net/process_management/context-switch-arch.html)

schedule() --> context_switch() --> switch_to --> __switch_to()

```
vim kernel/sched/core.c
```
