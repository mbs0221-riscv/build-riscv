# Ubuntu
[How to Install Ubuntu 18.04 LTS (Bionic Beaver) on UEFI and Legacy BIOS System](https://www.itzgeek.com/how-tos/linux/ubuntu-how-tos/how-to-install-ubuntu-18-04-lts-bionic-beaver-on-uefi-and-legacy-bios-system.html)

## desktop
```
$ ll /usr/share/applications/
```

## zsh
https://github.com/ohmyzsh/ohmyzsh
https://github.com/zsh-users/zsh-syntax-highlighting
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt install zsh-syntax-highlighting
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
```

## vcn remote desktop
```
sudo apt-get install x11vnc -y
sudo x11vnc -storepasswd /etc/x11vnc.pass
sudo touch /etc/systemd/system/x11vnc.service
```

```
[Unit]
Description=Start x11vnc at startup.
After=multi-user.target
[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -auth /run/user/1000/gdm/Xauthority -forever -loop -noxdamage -repeat -rfbauth /etc/x11vnc.pass -rfbport 5900 -shared
[Install]
WantedBy=multi-user.target
```

```
sudo systemctl enable x11vnc
sudo service x11vnc start

# 【报错：远程电脑上的软件似乎与此“屏幕共享”版本不兼容】
gsettings set org.gnome.Vino require-encryption false
```

## ssh
```
$ sudo apt install openssh-server
$ systemctl start sshd
$ systemctl status sshd
$ systemctl enable sshd
$ ssh-keygen -t rsa -P ""
$ scp ~/.ssh/id_rsa.pub ubuntu@10.10.72.159:/home/ubuntu/
$ scp ~/.ssh/id_rsa.pub ubuntu@10.10.72.155:/home/ubuntu/
$ cat ~/id_rsa.pub >> ~/.ssh/authorized_keys
$ ssh-copy-id -i ~/.ssh/id_rsa.pub ubuntu@10.10.72.155
```

## Ubuntu下的log日志查看器
1.lnav：Linux 下一个基于控制台的高级日志文件查看器
* https://www.cnblogs.com/michealLang/p/9761886.html
* http://www.imooc.com/article/80502

Usage:
```
$ sudo apt install lnav
$ lnav -h // 获取帮助信息
$ lnav // 查看日志
$ lnav /local/test.log //查看指定日志(后面加上绝对路径)
```

如何修改PKG_CONFIG_PATH环境变量？两种情况，如果你只是想加上某库的pkg，则选择下面其一：
```
$ export PKG_CONFIG_PATH=/usr/lib/pkgconfig/ 
$ export PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig/ 
```

Linux或Ubuntu中查看磁盘空间大小的10个df命令
```
$ df -h
```

Ubuntu下修改IP地址：
```
$ scp ubuntu@10.10.72.159
$ sudo vim /etc/netplan/01-network-manager-all.yaml
$ sudo netplan apply
$ sudo netplan --debug apply
$ ip addr
```

```
$ sudo fdisk -l /dev/sda
$ sudo gpart -W /dev/sda /dev/sda
```

## update-alternatives
display
```
$ sudo update-alternatives --display name
```
install
```
$ sudo update-alternatives --install link name path priority
$ sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 40
$ sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 40
$ sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-6.0 40
$ sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-10 50
$ sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-11 60
$ sudo update-alternatives --config clang
$ sudo update-alternatives --install /usr/bin/opt opt /usr/bin/opt-6.0 40
$ sudo update-alternatives --install /usr/bin/opt opt /usr/bin/opt-10 50
$ sudo update-alternatives --install /usr/bin/opt opt /usr/bin/opt-11 60
$ sudo update-alternatives --config opt
$ sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-6.0 40
$ sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-10 50
$ sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-11 60
$ sudo update-alternatives --config clang++
```

remove
```
$ sudo update-alternatives --remove name path
$ sudo update-alternatives --remove g++ /usr/bin/g++-4.8
```
config
```
$ sudo update-alternatives --config name
```
auto/manual
```
$ sudo update-alternatives --auto name
```

## find

    用来查找特定文件，在linux下一切皆是文件，因此十分有用。

    基本格式：find  path  expression  [-exec  command  {} \;] 

    会默认遍历到子目录。

1、find  /home/work/   -name  "*.cpp"    

    查找/home/work/目录下，所有文件名以.cpp结尾的文件，当然目录也会匹配出来。

2、find  /home/work/   -name  -type  f   "*.cpp"

    查找/home/work/目录下，所有文件名以.cpp结尾的普通文件。

3、find  /home/work/   -iname  "*.cpp"  

    -iname 表示忽略大小写，-name表示不忽略大小写，精确匹配。

4、find  /home/work/   /etc/  /usr  -name  "*.cpp"

    查找多个目录下的.cpp文件

    扩展 ： find  /home/work/   /etc/  /usr  -name  "[ab].cpp"     查找a.cpp或者b.cpp文件

    find  /home/work/   /etc/  /usr  -name  "?.cpp"           "?"表示任意一个字符

5、 find  /home/work/  -size +20M

      查找大于20M的文件，-20M表示小于20M

6、find  /home/work  -atime  -5

    查找5天内访问过的文件， +5 表示5天内没有访问过的文件。

    扩展：用stat命令可以获得相关的时间戳。atime表示最近一次访问的时间，mtime表示最近一次内容修改的时间，ctime表示最近一次属性修改的时间，单位是天。amin，mmin，cmin单位是分钟。

7、find  /home/work  -atime  -5  -a  -size -1M

    查找5天访问过的并且大小小于1M的文件。
     -a    与连接 ，   -o  或连接， -not  条件取反  
     
8、find ./ -maxdepth 2 -newermt "7/15/2021"
    
    查找当天创建的文件
## grep
```
$ grep -R -w -l 'boot' /etc
```

    用来匹配特定的文本行，全称是Global Regular Expression Print。

    基本格式：  grep  [OPTIONS]   PATTERN    [FILE...]

1、grep  "hello"  ./*

    遍历当前目录下的所有文件，把含有"hello"的文本行的打印出来。

    grep   -r  "hello"  ./*  会遍历子目录。

2、其他参数控制

    -i 匹配时，忽略大小写

    -n 显示行号

    -c 只显示匹配到的文本行总数

    -l 只显示匹配到文本行的文件名

    -v 显示没有匹配到的文本行，相当于取反操作。


————————————————
版权声明：本文为CSDN博主「KentZhang_」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/KentZhang_/article/details/50538777

