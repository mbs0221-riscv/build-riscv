/* gcd.c */
#include <linux/fs.h>
#include <linux/miscdevice.h>
#include <linux/init.h>
#include <linux/module.h>

#include <asm/io.h>

#include "gcd.h"

MODULE_AUTHOR("Benshan Mei");
MODULE_DESCRIPTION("Chipyard GCD Module");
MODULE_LICENSE("GPL");

#define GCD_STATUS (g_gcd_reg_base + 0x0000)
#define GCD_X      (g_gcd_reg_base + 0x0004)
#define GCD_Y      (g_gcd_reg_base + 0x0008)
#define GCD_GCD    (g_gcd_reg_base + 0x000C)

static void *g_gcd_reg_base = NULL;
static bool device_busy = false;

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
static long device_ioctl(struct file *file, unsigned int ioctl_num, unsigned long ioctl_param) {
  switch (ioctl_num) {
    default:
        return -1;
  }

  return 0;
}

// ---------------------------------------------------------------------------
static struct file_operations f_ops = {.unlocked_ioctl = device_ioctl,
                                       .open = device_open,
                                       .release = device_release};

// ---------------------------------------------------------------------------
static struct miscdevice misc_dev = {
    .minor = MISC_DYNAMIC_MINOR,
    .name = GCD_DEVICE_NAME,
    .fops = &f_ops,
    .mode = S_IRWXUGO,
};

// ---------------------------------------------------------------------------
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
	while ((readb(GCD_STATUS) & 0x2) == 0);

	writel(x, GCD_X);
	writel(y, GCD_Y);

	// wait for peripheral to complete
	printk(KERN_INFO "wait for peripheral to complete\n");
	while ((readb(GCD_STATUS) & 0x1) == 0);

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

	printk(KERN_INFO "Registering peripheral gcd device\n");

	int r;
	r = misc_register(&misc_dev);
	if (r != 0) {
		printk(KERN_ALERT "Failed registering gcd device with %d\n", r);
		return 1;
	}

	printk(KERN_INFO "peripheral gcd init finished\n");

	return 0;
}

static void gcd_exit(void)
{
	misc_deregister(&misc_dev);

	printk(KERN_INFO "Bye Bye !\n");
}

module_init(gcd_init); /* When u use insmod, it will enter gcd_init function */
module_exit(gcd_exit); /* When u use rmmod, it will enter gcd_exit function */
