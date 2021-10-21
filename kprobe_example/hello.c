/* hello.c */
#include <linux/init.h>
#include <linux/module.h>

#ifndef CONFIG_BCS
# define CONFIG_BCS
#endif

#include <asm/csr.h>
	
MODULE_DESCRIPTION("Chipayrd BCS Module");
MODULE_LICENSE("GPL");

typedef struct {
	uint64_t bcs;
	uint64_t base;
	uint64_t end;
	uint64_t cfg;
} bcs_t;

void bcs_init(void)
{
	printk(KERN_INFO "BCS init\n");

	csr_write(0x8c0, 0x0);
	csr_write(0x8c1, 0x80200000);
	csr_write(0x8c2, 0x100000000L);
	csr_write(0x8c3, 0x80);
	
	uint64_t bcs  = csr_read(0x8c0);
	uint64_t base = csr_read(0x8c1);
	uint64_t end  = csr_read(0x8c2);
	uint64_t cfg  = csr_read(0x8c3);

	printk("bcs_init[%lx, %lx, %lx, %lx]\n", bcs, base, end, cfg);
}

void bcs_set(bcs_t p)
{
	csr_write(0x8c0, p.bcs);
	csr_write(0x8c1, p.base);
	csr_write(0x8c2, p.end);
	csr_write(0x8c3, p.cfg);
	// asm volatile ("sfence.vma" ::: "memory");
}

bcs_t bcs_read(void)
{
	bcs_t p = { 
		.bcs  = csr_read(0x8c0),
		.base = csr_read(0x8c1),
		.end  = csr_read(0x8c2),
		.cfg  = csr_read(0x8c3)
	};	

	return p;
}

static int hello_init(void)
{
	printk(KERN_INFO "Hello world!\n");

	bcs_init();

	printk(KERN_INFO "BCS test started.\n");
	bcs_t p = bcs_read();
	printk(KERN_INFO "bcs_read[%lx, %lx, %lx, %lx]\n", p.bcs, p.base, p.end, p.cfg);

	return 0;
}

static void hello_exit(void)
{
	printk(KERN_INFO "Bye Bye !\n");
}

module_init(hello_init);
/* When u use insmod, it will enter hello_init function */
 
module_exit(hello_exit);
/* When u use rmmod, it will enter hello_exit function */
