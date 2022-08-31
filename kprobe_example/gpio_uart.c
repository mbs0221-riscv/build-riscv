#include <linux/gpio/consumer.h>

struct gpio_desc {
    struct gpio_chip    *chip;
    unsigned long       flags;
#ifdef CONFIG_DEBUG_FS
    const char      *label;
#endif
};

/* flag symbols are bit numbers */

#define FLAG_REQUESTED   0
#define FLAG_IS_OUT      1
#define FLAG_EXPORT      2   /* protected by sysfs_lock */
#define FLAG_SYSFS       3   /* exported via /sys/class/gpio/control */
#define FLAG_TRIG_FALL   4   /* trigger on falling edge */
#define FLAG_TRIG_RISE   5   /* trigger on rising edge */
#define FLAG_ACTIVE_LOW  6   /* value has active low */
#define FLAG_OPEN_DRAIN  7   /* Gpio is open drain type */
#define FLAG_OPEN_SOURCE 8   /* Gpio is open source type */
#define FLAG_USED_AS_IRQ 9   /* GPIO is connected to an IRQ */

#define ID_SHIFT         16  /* add new flags before this one */

#define GPIO_FLAGS_MASK     ((1 << ID_SHIFT) - 1)
#define GPIO_TRIGGER_MASK   (BIT(FLAG_TRIG_FALL) | BIT(FLAG_TRIG_RISE))

static int sifive_gpio_uart_probe(struct platform_device *pdev)
{
  struct gpio_desc *dt_gpio_tx, *dt_gpio_rx;
  struct device *dev = &pdev->dev;

  printk(KERN_INFO "sifive_gpio_uart: Initializing module...\n");

  dt_gpio_tx = gpiod_get(dev, "gpio_tx");
  if(IS_ERR(dt_gpio_tx)) {
      pr_err("gpio_tx gpiod_get failed\n");
      dt_gpio_tx = NULL;
  } else {
      set_bit(FLAG_OPEN_DRAIN, &dt_gpio_tx->flags);
      gpio_tx = desc_to_gpio(dt_gpio_tx);
  }

  dt_gpio_rx = gpiod_get(dev, "gpio_rx");
  if(IS_ERR(dt_gpio_rx)) {
      pr_err("gpio_rx gpiod_get failed\n");
      dt_gpio_rx = NULL;
  } else {
      set_bit(FLAG_OPEN_DRAIN, &dt_gpio_rx->flags);
      gpio_rx = desc_to_gpio(dt_gpio_rx);
  }

  return 0;
}

static int __init sifive_gpio_uart_init(void)
{
    return platform_driver_register(&sifive_gpio_uart);
}

static void __exit sifive_gpio_uart_exit(void)
{
    platform_driver_unregister(&sifive_gpio_uart);
}

static const struct of_device_id sifive_gpio_uart_of_match[] = { 
        { .compatible = "sifive,softuart", },
        {}
};
MODULE_DEVICE_TABLE(of, sifive_gpio_uart_of_match);

static struct platform_driver sifive_gpio_uart_driver = { 
        .probe = sifive_gpio_uart_probe,
        .remove = sifive_gpio_uart_remove,
        .driver = { 
                .name = "sifive_gpio_uart", // SIFIVE_SPI_DRIVER_NAME,
                .of_match_table = sifive_spi_of_match,
        },
};
module_platform_driver(sifive_gpio_uart_driver);

MODULE_AUTHOR("SiFive, Inc. <sifive@sifive.com>");
MODULE_DESCRIPTION("SiFive GPIO-UART Driver");
MODULE_LICENSE("GPL");
