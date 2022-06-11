# gcc
[gcc编译工具生成动态库和静态库之一----介绍](https://www.cnblogs.com/fnlingnzb-learner/p/8059251.html)

* 动态库生成
```
$ gcc -fPIC -shared xxx.c -o libxxx.so
$ gcc -fPIC -shared xxx1.c xxx2.c xxx3.c -o libxxx.so 
```
* 静态库生成
```
$ ar -rc libxxx.a xxx.o（正确方法）
$ ar -rc libxxx.a xxx1.o xxx2.o xxx3.o （正确方法）
```
* 多个源文件生成一个可执行文件
```
$ gcc xxx1.c xxx2.c xxx3.c xxx4.c main.c -o main
```
交叉编译gcc
```
$ wget http://mirrors.ustc.edu.cn/gnu/gcc/gcc-9.2.0/gcc-9.2.0.tar.gz
$ ./contrib/download_prerequisites
$ mkdir build && cd build
$ CC=riscv64-unknown-linux-gnu-gcc AR=riscv64-unknown-linux-gnu-ar ../configure --prefix=/home/ubuntu/riscv-linux/rootfs/usr/local/gcc/ --enable-checking=release --enable-languages=c,c++ --enable-threads=posix --disable-multilib --build=x86-64-linux-gnu --host=riscv64-unknown-elf --target=riscv64-unknown-elf
$ make -j10 && make install
```
配置：
* --prefix=/mnt/ssd/gcc 指定安装目录
* --enable-languages=c,c++ 支持的编程语言
* --enable-threads=posix 使用posix/unix98作为支持线程库
* --disable-multilib 取消32位库编译
* --host --build --target 举例如下:
    * --build=i686-pc-linux-gnu --host=arm --target=mips
表示在pc上进行编译，编译运行在arm上的gcc，gcc生成mips指令架构的程序