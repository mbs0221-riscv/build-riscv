/* gcd-driver.c */

#include <linux/fs.h>
#include <linux/miscdevice.h>
#include <linux/init.h>
#include <linux/module.h>

#include <asm/io.h>

// #include "gcd.h"

#define SIFIVE_SPI_DRIVER_NAME           "chipyard_gcd"

/* register offsets */
#define CHIPYARD_GCD_REG_STATUS 0x0000
#define CHIPYARD_GCD_REG_X      0x0004
#define CHIPYARD_GCD_REG_Y      0x0008
#define CHIPYARD_GCD_REG_GCD    0x000C

struct chipyard_gcd {
        void __iomem      *regs;        /* virt. address of control registers */
        // struct clk        *clk;         /* bus clock */
        // unsigned int      fifo_depth;   /* fifo depth in words */
        // u32               cs_inactive;  /* level of the CS pins when inactive */
        // struct completion done;         /* wake-up from interrupt */
};


static int chipyard_gcd_probe(struct platform_device *pdev)
{
        int ret;
        
}

static const struct of_device_id chipyard_gcd_of_match[] = {
        { .compatible = "ucbbar,gcd", },
        {}
};
MODULE_DEVICE_TABLE(of, chipyard_gcd_of_match);

static struct platform_driver chipyard_gcd_driver = {
        .probe = chipyard_gcd_probe,
        .remove = chipyard_gcd_remove,
        .driver = {
                .name = SIFIVE_SPI_DRIVER_NAME,
                .of_match_table = chipyard_gcd_of_match,
        },
};
module_platform_driver(chipyard_gcd_driver);

MODULE_AUTHOR("Chipyard. <mbs2021@163.com>");
MODULE_DESCRIPTION("Chipyard GCD driver");
MODULE_LICENSE("GPL");