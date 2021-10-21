#include <linux/module.h>    // included for all kernel modules
#include <linux/kernel.h>    // included for KERN_INFO
#include <linux/init.h>        // included for __init and __exit macros
#include <linux/cred.h>
#include <linux/sched.h>
 
static int __init cred_init(void)
{ 
    struct cred *currentCred;
    currentCred = current->cred;    
    printk(KERN_INFO "uid = %d\n", currentCred->uid);
    printk(KERN_INFO "gid = %d\n", currentCred->gid);
    printk(KERN_INFO "suid = %d\n", currentCred->suid);
    printk(KERN_INFO "sgid = %d\n", currentCred->sgid);
    printk(KERN_INFO "euid = %d\n", currentCred->euid);
    printk(KERN_INFO "egid = %d\n", currentCred->egid);  
 
    printk(KERN_INFO "Hello world!\n"); 
    return 0;    // Non-zero return means that the module couldn't be loaded.
}
 
static void __exit cred_cleanup(void)
{
    printk(KERN_INFO "Cleaning up module.\n");
}
 
module_init(cred_init);
module_exit(cred_cleanup);
