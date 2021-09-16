/* gcd.c */
#include <linux/init.h>
#include <linux/module.h>

//##include <asm-generic/io.h>
//#include <asm/pgtable.h>
//#include <asm/csr.h>
#include <asm/io.h>

MODULE_DESCRIPTION("Chipyard GCD Module");
MODULE_LICENSE("GPL");

#define GCD_STATUS (g_gcd_reg_base + 0x0000)
#define GCD_X      (g_gcd_reg_base + 0x0004)
#define GCD_Y      (g_gcd_reg_base + 0x0008)
#define GCD_GCD    (g_gcd_reg_base + 0x000C)

unsigned int gcd_ref(unsigned int x, unsigned int y)
{

	while (y != 0) {
		if (x > y)
			x = x - y;
		else
			y = y - x;
	}

	return x;
}

static void *g_gcd_reg_base = NULL;

static int gcd_init(void)
{
	printk(KERN_INFO "Hello world !\n");

	uint32_t result, ref, x, y;
	x = 20;
	y = 15;

	g_gcd_reg_base = ioremap(0x2000, 0x1000);
	if (g_gcd_reg_base == NULL) {
		printk(KERN_INFO "peripheral gcd init failed\n");
		return 1;
	}

	// wait for peripheral to be ready
	printk(KERN_INFO "wait for peripheral to be ready\n");
	while ((readb(GCD_STATUS) & 0x2) == 0) ;

	writel(x, GCD_X);
	writel(y, GCD_Y);

	// wait for peripheral to complete
	printk(KERN_INFO "wait for peripheral to complete\n");
	while ((readb(GCD_STATUS) & 0x1) == 0) ;

	result = readl(GCD_GCD);
	ref = gcd_ref(x, y); 

	if (g_gcd_reg_base != NULL) {
		iounmap(g_gcd_reg_base);
		g_gcd_reg_base = NULL;
	}

	printk(KERN_INFO "Software result: %d", ref);
	printk(KERN_INFO "Hareware result: %d", result);

	if (result != ref) {
		printk(KERN_INFO "Hardware result %d does not match reference value %d\n", result, ref);
		return 1;
	}

	printk(KERN_INFO "peripheral gcd init finished\n");

	return 0;
}

static void gcd_exit(void)
{
    printk(KERN_INFO "ByeBye !\n");
}

module_init(gcd_init);
/* When u use insmod, it will enter gcd_init function */
 
module_exit(gcd_exit);
/* When u use rmmod, it will enter gcd_exit function */
