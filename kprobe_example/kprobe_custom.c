//kprobe_custom.c
#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/kprobes.h>

#define MAX_SYMBOL_LEN	64
static char symbol[MAX_SYMBOL_LEN] = "kernel_clone";
module_param_string(symbol, symbol, sizeof(symbol), 0644);

/* For each probe you need to allocate a kprobe structure */
static struct kprobe kp = { 
        .symbol_name    = symbol,
};

static int total_count = 0;

/* kprobe pre_handler: called just before the probed instruction is executed */
static int handler_pre(struct kprobe *p, struct pt_regs *regs)
{

#ifdef CONFIG_RISCV
	pr_info("<%s> p->addr = 0x%p, pc = 0x%lx, status = 0x%lx\n",
		p->symbol_name, p->addr, regs->epc, regs->status);
#endif

        total_count++;
        printk(KERN_INFO "do_fork has been called for [%d] times\n",total_count);
        return 0;
}

/* kprobe post_handler: called after the probed instruction is executed */
static void handler_post(struct kprobe *p, struct pt_regs *regs,
                                unsigned long flags)
{
	
}

static int kprobe_init(void){
        int ret;
        kp.pre_handler = handler_pre;
        kp.post_handler = handler_post;

        ret = register_kprobe(&kp);
        if (ret < 0) {
                printk(KERN_INFO "register_kprobe failed, returned %d\n", ret);
                return ret;
        }
        printk(KERN_INFO "Planted kprobe at %p\n", kp.addr);
        return 0;
}

static void kprobe_exit(void){
        unregister_kprobe(&kp);
        printk(KERN_INFO "kprobe at %p unregistered\n", kp.addr);
}

module_init(kprobe_init);
module_exit(kprobe_exit);
MODULE_LICENSE("GPL");

