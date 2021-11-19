#include <asm/tlbflush.h>
#include <asm/uaccess.h>
#include <asm/syscall.h>
#include <linux/kallsyms.h>
#include <linux/fs.h>
#include <linux/miscdevice.h>
#include <linux/mm.h>
#include <linux/module.h>
#include <linux/version.h>
#include <linux/ptrace.h>
#include <linux/proc_fs.h>
#include <linux/kprobes.h>

#ifndef CONFIG_BCS
# define CONFIG_BCS
#endif

#include <asm/csr.h>

#include "sysfilter.h"

MODULE_AUTHOR("Michael Schwarz");
MODULE_DESCRIPTION("Filter syscalls");
MODULE_LICENSE("GPL");

#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 17, 0) && CONFIG_RISCV
#define REGS_DEFINES struct pt_regs *regs
#define REGS regs
#define SYSNO regs->a7
#else
#define REGS_DEFINES long unsigned int a, long unsigned int b, long unsigned int c, long unsigned int d, long unsigned int e, long unsigned int f
#define REGS a, b, c, d, e, f
#define SYSNO ???
#error "Old linux does not provide us with syscall number"
#endif

#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 11, 0)
#define from_user raw_copy_from_user
#define to_user raw_copy_to_user
#else
#define from_user copy_from_user
#define to_user copy_to_user
#endif

static bool device_busy = false;
static int pid_filter = 0;
//static int has_pke = 0;
//static int pkey = 0;
//static uint32_t pkru_init_value = 0;
static int kill_on_violation = 0;

// ---------------------------------------------------------------------------
static int device_open(struct inode *inode, struct file *file) {
	/* Check if device is busy */
	if (device_busy == true) {
		return -EBUSY;
	}

	/* Lock module */
	try_module_get(THIS_MODULE);

	device_busy = true;

	return 0;
}

// ---------------------------------------------------------------------------
static int device_release(struct inode *inode, struct file *file) {
	/* Unlock module */
	device_busy = false;

	module_put(THIS_MODULE);

	return 0;
}

// ---------------------------------------------------------------------------
static sys_call_ptr_t old_sys_call_table[__NR_syscall_max];
static sys_call_ptr_t* syscall_tbl;

// ---------------------------------------------------------------------------
static long hook_generic(const struct pt_regs *regs) {

	int pid = task_pid_nr(current);
	int sys_nr = syscall_get_nr(current, regs);

	if(pid_filter && pid == pid_filter) {

	 	uint64_t bcs  = csr_read(0x8c0);
		uint64_t base = csr_read(0x8c1);
		uint64_t end  = csr_read(0x8c2);
		uint64_t cfg  = csr_read(0x8c3);

		printk(KERN_INFO "bcs_read[%llx, %llx, %llx, %llx]\n", bcs, base, end, cfg);
	}

	return old_sys_call_table[sys_nr](REGS);
}

// ---------------------------------------------------------------------------
static void hook_syscall(int nr, sys_call_ptr_t hook) {
	// unprotect syscall table
	printk("[sysfilter-module] Hooking syscall %d\n", nr);
	syscall_tbl[nr] = hook;
}

// ---------------------------------------------------------------------------
static void unhook_syscall(int nr) {
	// unprotect syscall table
	printk("[sysfilter-module] Unhooking syscall %d\n", nr);
	syscall_tbl[nr] = old_sys_call_table[nr];
}

// ---------------------------------------------------------------------------
static long device_ioctl(struct file *file, unsigned int ioctl_num, unsigned long ioctl_param) {
	switch (ioctl_num) {
		case SYSFILTER_IOCTL_CMD_BLOCK:
		{
			hook_syscall(ioctl_param, hook_generic);
			return 0;
		}
		case SYSFILTER_IOCTL_CMD_UNBLOCK:
		{
			unhook_syscall(ioctl_param);
			return 0;
		}
		case SYSFILTER_IOCTL_CMD_PID:
		{
			pid_filter = ioctl_param;
			return 0;
		}
		case SYSFILTER_IOCTL_CMD_WRITEKEY:
		{
//			pkey = ioctl_param;
			return 0;
		}
		case SYSFILTER_IOCTL_CMD_KILL_ON_VIOLATION:
		{
			kill_on_violation = ioctl_param;
			return 0;
		}
		default:
			return -1;
	}

	return 0;
}

// ---------------------------------------------------------------------------
static struct file_operations f_ops = {
	.unlocked_ioctl = device_ioctl,
	.open = device_open,
	.release = device_release
};

// ---------------------------------------------------------------------------
static struct miscdevice misc_dev = {
	.minor = MISC_DYNAMIC_MINOR,
	.name = SYSFILTER_DEVICE_NAME,
	.fops = &f_ops,
	.mode = S_IRWXUGO,
};

// ---------------------------------------------------------------------------
int init_module(void) {
	int r, i;

	csr_write(0x8c0, 0x0);
	csr_write(0x8c1, 0x80200000);
	csr_write(0x8c2, 0x100000000L);
	csr_write(0x8c3, 0x80);

	// register device
	r = misc_register(&misc_dev);
	if (r != 0) {
		printk(KERN_ALERT "[sysfilter-module] Failed registering device with %d\n", r);
		return 1;
	}

	syscall_tbl = (sys_call_ptr_t*)kallsyms_lookup_name("sys_call_table");
	printk("[sysfilter-module] Syscall table @ %zx\n", (size_t)syscall_tbl);

	// backup old sys call table
	for(i = 0; i < __NR_syscall_max; i++) {
		old_sys_call_table[i] = syscall_tbl[i];
	}

	printk(KERN_INFO "[sysfilter-module] Loaded.\n");

	return 0;
}

// ---------------------------------------------------------------------------
void cleanup_module(void) {
	int i;
	misc_deregister(&misc_dev);

	// restore old syscall table
	for(i = 0; i < __NR_syscall_max; i++) {
		syscall_tbl[i] = old_sys_call_table[i];
	}

	printk(KERN_INFO "[sysfilter-module] Removed.\n");
}
