# Fuzzing
## Run afl-fuzz on riscv-linux
* [afl-fuzz on ppc](https://mykter.com/2016/04/27/afl-on-ppc)

## AFL
Install AFL
```
$ sudo apt-get install clang
$ sudo apt-get install llvm
$ wget http://lcamtuf.coredump.cx/afl/releases/afl-2.52b.tgz
$ tar -zxvf afl-2.52b.tgz
$ cd afl-2.52b
$ make
$ sudo  make install
```
AFL-LLVM
```
ubuntu@optiplex-5060:~/afl-2.52b$ alias gmake=make
ubuntu@optiplex-5060:~/afl-2.52b$ AFL_NO_X86=1 gmake && gmake -C llvm_mode
```
AFL Example
```
#include <stdio.h> 
#include <stdlib.h> 
#include <unistd.h> 
#include <string.h> 
#include <signal.h> 

int vuln(char *str)
{
    int len = strlen(str);
    if(str[0] == 'A' && len == 66)
    {
        raise(SIGSEGV);
        //如果输入的字符串的首字符为A并且长度为66，则异常退出
    }
    else if(str[0] == 'F' && len == 6)
    {
        raise(SIGSEGV);
        //如果输入的字符串的首字符为F并且长度为6，则异常退出
    }
    else
    {
        printf("it is good!\n");
    }
    return 0;
}

int main(int argc, char *argv[])
{
    char buf[100]={0};
    gets(buf);//存在栈溢出漏洞
    printf(buf);//存在格式化字符串漏洞
    vuln(buf);

    return 0;
}

```
Running AFL
```
ubuntu@optiplex-5060:~/test$ afl-gcc -g -o afl_test test.c
```
接着建立一个testcase的文件夹，建立一个几个字母的文件，然后可以在终端输入：
```
ubuntu@optiplex-5060:~/test$ afl-fuzz -i testcase -o output ./afl_test
```
```
ubuntu@optiplex-5060:~/test$ afl-fuzz -i testcase -o output ./afl_test
afl-fuzz 2.52b by <lcamtuf@google.com>
[+] You have 12 CPU cores and 2 runnable tasks (utilization: 17%).
[+] Try parallel jobs - see /usr/local/share/doc/afl/parallel_fuzzing.txt.
[*] Checking CPU core loadout...
[+] Found a free CPU core, binding to #0.
[*] Checking core_pattern...

[-] Hmm, your system is configured to send core dump notifications to an
    external utility. This will cause issues: there will be an extended delay
    between stumbling upon a crash and having this information relayed to the
    fuzzer via the standard waitpid() API.

    To avoid having crashes misinterpreted as timeouts, please log in as root
    and temporarily modify /proc/sys/kernel/core_pattern, like so:

    echo core >/proc/sys/kernel/core_pattern

[-] PROGRAM ABORT : Pipe at the beginning of 'core_pattern'
         Location : check_crash_handling(), afl-fuzz.c:7275
```
```
root@optiplex-5060:/home/ubuntu/test# echo core >/proc/sys/kernel/core_pattern
```
```
ubuntu@optiplex-5060:~/test$ afl-fuzz -i testcase -o output ./afl_test
afl-fuzz 2.52b by <lcamtuf@google.com>
[+] You have 12 CPU cores and 5 runnable tasks (utilization: 42%).
[+] Try parallel jobs - see /usr/local/share/doc/afl/parallel_fuzzing.txt.
[*] Checking CPU core loadout...
[+] Found a free CPU core, binding to #0.
[*] Checking core_pattern...
[*] Checking CPU scaling governor...

[-] Whoops, your system uses on-demand CPU frequency scaling, adjusted
    between 781 and 4492 MHz. Unfortunately, the scaling algorithm in the
    kernel is imperfect and can miss the short-lived processes spawned by
    afl-fuzz. To keep things moving, run these commands as root:

    cd /sys/devices/system/cpu
    echo performance | tee cpu*/cpufreq/scaling_governor

    You can later go back to the original state by replacing 'performance' with
    'ondemand'. If you don't want to change the settings, set AFL_SKIP_CPUFREQ
    to make afl-fuzz skip this check - but expect some performance drop.

[-] PROGRAM ABORT : Suboptimal CPU scaling governor
         Location : check_cpu_governor(), afl-fuzz.c:7337
```