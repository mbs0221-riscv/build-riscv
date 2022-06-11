
# kProbe
> [内核调测工具Kprobe之实践篇](https://os.51cto.com/art/202102/645366.htm)

```
# 挂载debugfs
[root@vc709 ~]#mount -t debugfs nodev /sys/kernel/debug

# 进入tracing目录
[root@vc709 ~]#cd /sys/kernel/debug/tracing
[root@vc709 tracing]#echo "p:sys_write_event sys_write" > kprobe_events

# 使能kprobe
[root@vc709 tracing]#cd events/kprobes/sys_write_event/
[root@vc709 sys_write_event]#ll
total 0
-rw-r--r--    1 root     root             0 Sep 23 15:52 enable
-rw-r--r--    1 root     root             0 Sep 23 15:52 filter
-r--r--r--    1 root     root             0 Sep 23 15:52 format
-rw-r--r--    1 root     root             0 Sep 23 15:52 trigger
[root@vc709 sys_write_event]#echo 1 > enable

cat trace

# 撤销kprobe。执行
cd /sys/krenel/debug/tracing/events/sys_write_event
echo 0 > enable
cd /sys/kernel/debug/tracing
echo "-:kprobes/sys_write_event" >> kprobe_events
```

```
[root@vc709 ~]#modprobe kprobe_custom
[  518.109623] Planted kprobe at 000000007d07c9ec
[  518.122451] <kernel_clone> p->addr = 0x000000007d07c9ec, pc = 0xffffffff8000ca1e, status = 0xffffffff80034e4e
[  518.123579] do_fork has been called for [1] times
[  538.544689] <kernel_clone> p->addr = 0x000000007d07c9ec, pc = 0xffffffff8000ca1e, status = 0xffffffff8088171a
[  538.546107] do_fork has been called for [2] times
```