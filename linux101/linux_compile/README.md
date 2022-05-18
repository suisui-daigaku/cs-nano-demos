# Linux 内核编译

## 参考资料

- [Gentoo Wiki](https://wiki.gentoo.org/wiki/Main_Page)
- https://www.kali.org/docs/development/recompiling-the-kali-linux-kernel/
- [Debian Kernel Compilation - 2 ways - make-kpkg (new) and make (old) - infotinks](http://www.infotinks.com/debian-kernel-compilation-2-ways-make-kpkg-new-make-old/)

有问题随时参考 gentoo 的 wiki 

---

## Q & A 

### Install Linux Header Only

如果自己编译内核，一般情况下都知道

- 如何安装 Linux Image, Linux initramfs, Linux Config 到 Boot 下面
- 如何安装 modules 

但很多人都会忽略 Linux Header，根据 Linux 的官方介绍，这是给 userspace 的程序调用 systemcall 的标准。

这时候有两种方法，

1. 跟着 Kali Linux 的步骤重新编译一次，并生成 deb 安装包
2. 单独生成 Linux Header

这里记录一下第二种做法，如何做出一个 deb 包。

[Debian Kernel Compilation - 2 ways - make-kpkg (new) and make (old) - infotinks](http://www.infotinks.com/debian-kernel-compilation-2-ways-make-kpkg-new-make-old/)

***用 deb 包的好处是可以用 apt 随时删除***。

- http://www.howtoforge.com/kernel_compilation_debian_etch
- http://www.tecmint.com/kernel-compilation-in-debian-linux/
- http://syslint.com/syslint/how-to-compile-linux-kernel-in-debian-ubuntu-the-easy-way/

在制作 deb 包的时候，需要保证里面的文件是 root 的，可以用 fakeroot 实现。

- [使用fakeroot模拟root权限执行程序 (kghost.info)](https://blog.kghost.info/2011/02/11/使用fakeroot模拟root权限执行程序/)
- [O'Reilly Japan - ハッカー秘伝のテクニック100選 Binary Hacks (oreilly.co.jp)](https://www.oreilly.co.jp/books/4873112885/)
- [8.10. Compiling a Kernel (debian-handbook.info)](https://debian-handbook.info/browse/squeeze/sect.kernel-compilation.html)

```shell
# 要不要都可以
apt-get install build-essential

# 制作 deb 包需要的工作
apt-get install fakeroot kernel-package

# ncurses 就是在 menuconfig 界面
apt-get install libncurses5-dev

# 解压
tar -xvJf linux-3.12.tar.xz


# 复制当前 kernel 的配置文件(这个看个人需求, 一般 /boot/ 有好几个 kernel, 没有就从新开始)
cp /boot/config-`uname –r`.config


# 或者可以是 make oldconfig (如果之前的 kernel 版本不一样)
make menuconfig


# 清楚已有的包
make-kpkg clean


# 自己看一下就懂了
export CONCURRENCY_LEVEL=3


# 看一下就知道了，会在目录下生成 Linux 内核的镜像 和 header
# 至于 append to version 和 revision 都是在后面的后缀，可以不管。
fakeroot make-kpkg --append-to-version "-customkernel" --revision "1" --initrd kernel_image kernel_headers


# 看一下就知道了
dpkg -i linux-image-3.12.0-customkernel_1_i386.deb linux-headers-3.12.0-customkernel_1_i386.deb


# 如果有生成 Image, 可以安装到 /boot 下，然后加一下启动菜单
update-grub


# 重启
reboot 
```





