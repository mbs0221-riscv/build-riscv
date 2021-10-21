#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/fs.h>
#include <asm/io.h>
#include <linux/io.h>
#include <linux/uaccess.h>
#include <linux/proc_fs.h>
#include <linux/slab.h>
 
/* 定义一个proc_dir_entry结构体类型变量*/
struct proc_dir_entry *hello_proc = NULL;
/* 定义一个全局数据，用来保存用户空间返回的数据 */
static char hello_data[20] = {};
 
/* 如果使用cat此节点，则传入的count为4K，直到读取的数据大小为4K，也就是直到此函数返回0
   当此函数返回0时，读取到的内容是不显示的。
 */
static ssize_t hello_proc_read(struct file *fp, char __user *user_buf, size_t count, loff_t *ppos)
{
	int ret = 0;
	/* 首先清空用户空间的user_buf地址的内容,有可能显示杂乱信息 */
	if (clear_user(user_buf, count)) {
		printk(KERN_ERR "clear error\n");
		return -EIO;
	}
	
	/* 从hello_data数组中读取数据到用户空间user_buf，读取的长度应该是字符串的大小 */
	ret = simple_read_from_buffer(user_buf, count, ppos, hello_data, strlen(hello_data));
	
	return ret;
}
 
/*
  用户空间使用echo往此节点写入数据，只有要写入的数据写完之后，也就是返回count是，此函数此不会被调用
*/
static ssize_t hello_proc_write(struct file *fp, const char __user *user_buf, size_t count, loff_t *ppos)
{
	int ret;

	printk("hello_proc_write：count is %d.\n",count);

	/* 写入数据之前，将数组清空 */
	memset(hello_data,0,sizeof(hello_data));
	/* 将用户空间写入的数据保存到数据中 */
	ret = simple_write_to_buffer(hello_data, sizeof(hello_data),ppos,user_buf,count);
	
	printk("hello_proc_write：ret is %d.\n",ret);
	printk("hello_proc_write：user_buf is %s",hello_data);

	/* 返回用户空间写入字符串的大小 */
	return count;
}
 
/* 定义一个file_operations结构体变量 */				      
static const struct file_operations hello_proc_fops = {
	.owner	= THIS_MODULE,
	.read	= hello_proc_read,	//使用cat时的回调函数
	.write	= hello_proc_write,	//使用echo时的回调函数
};
 
/* 驱动入口函数 */
static int __init proc_test_init(void)
{
	/* 调用proc_create()函数创建"hello_proc"文件 */
	hello_proc = proc_create("hello_proc", 0,NULL,&hello_proc_fops);

	return 0;
}
 
/* 驱动出口函数 */
static void __exit proc_test_exit(void)
{	
	/* 删除此文件 */
	if(hello_proc)
		remove_proc_entry("hello_proc", NULL);
}
 
module_init(proc_test_init);
module_exit(proc_test_exit);
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("proc filesystem test by Haitao Cai");
