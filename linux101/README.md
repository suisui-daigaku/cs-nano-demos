# Linux 101

[Linux 基础入门_Linux - 蓝桥云课 (lanqiao.cn)](https://www.lanqiao.cn/courses/1)

[Linux 运维新手入门课_Linux - 蓝桥云课 (lanqiao.cn)](https://www.lanqiao.cn/courses/1403)

## Terminal/Console/Typewriter

[Terminals, Consoles & Shells Explained... - Sab's Blog (sebastiangogola.com)](https://sebastiangogola.com/terminals-consoles-shells-explained/)

**A teleprinter (teletypewriter, *teletype* or TTY)** is an electromechanical device that can be used to send and receive messages. 

<img src="teletype.jpg" alt="Using a 1930 Teletype as a Linux Terminal - YouTube" style="zoom:50%;" />  

From [Using a 1930 Teletype as a Linux Terminal - YouTube](https://www.youtube.com/watch?v=2XLZ4Z8LpEE)

That is what `tty` stands for. 

> In Linux, there is a pseudo-teletype multiplexor which handles the connections from all of the terminal window pseudo-teletypes (PTS).

If you know about how [Graphics card](https://en.wikipedia.org/wiki/Graphics_card) (or Video Graphics Array) works, you will not feel surprised. The screen of the monitor is basically a paper, and the message is printed pixel by pixel on the screen by Linux OS. 

Now you should understand the concept of ***"stream"*** , it is a serial string of bytes/characters (from your keyboard, or the mainframe, think about how a teletype works). 

In conclusion, **Terminal** is a software emulated-teletype, it can send and receive message to/from the mainframe ***(stdin, stdout, stderr)*** . Interestingly, the mainframe can be a local or remote machine. 

- Local : pseudo-teletype **(PTY, PTS, TTY)** 
- Remote : [PuTTY](https://www.ssh.com/ssh/putty/)

## Sesstion 

The connection ***between a terminal and the server is called a sesstion*** (think of a terminal is the client, and the operating system or the desired application is the server. In fact, the client-server model is used more frequently than we though in our computer). 

By typing the `tty` command, we can see which termianl that we are using. 

```
$ tty
/dev/ttys000
```

In Unix/Linux, every thing is a file, including ***devices***. 

A file, is basically ***a serial of bytes*** (you can view the content of a file by hex editor).  

The ***stream***, is also a serial of bytes/characters (we know `char` happens to be a byte since ASCII encoding), but it may with time stamps. 

If you open another terminal, and type `tty` again

<img src="image-20220504201930456.png" alt="image-20220504201930456" style="zoom: 50%;" />

Not surprising, right?  

## Terminal Multiplexor

[Home · tmux/tmux Wiki (github.com)](https://github.com/tmux/tmux/wiki)

The concept of "terminal multiplexor" is very strange for us nowadays, becasue we can open any number of new winodws in the GUI. But it is still useful if you connect to a remote server. 

Think about this scenario, you have a huge project in the remote server and the project may take about 10 hours to complete the compilation process. But we still want to do other stuff on the remote server but we can't kill or pause the terminal that running gcc.  

We want to open another terminal which conncects to the same server. 

> Multiplexor is a phsical or virtual device that maintain ***one-to-many communication***
>
> | Dedicated Circuit                                            | Multiplexing                                                 |
> | ------------------------------------------------------------ | ------------------------------------------------------------ |
> | ![img](3-s2.0-B9780122090059500138-f09-31-9780122090059.jpg) | ![img](3-s2.0-B9780122090059500138-f09-32-9780122090059.jpg) |
>
> From https://www.sciencedirect.com/topics/engineering/multiplexors 

## Shell

[Terminals, Consoles & Shells Explained... - Sab's Blog (sebastiangogola.com)](https://sebastiangogola.com/terminals-consoles-shells-explained/)

***Shell*** is also called a wrapper (like the wrapping paper for chocolate packaging), and the operating system is called ***kernel*** (the core of chocolate!)

<img src="DzNLZ.png" alt="operating system - What is the difference between the kernel space and the  user space? - Stack Overflow" style="zoom:33%;" />

From https://stackoverflow.com/questions/5957570/what-is-the-difference-between-the-kernel-space-and-the-user-space

The Shell is the application that can ***handle over the operations to the other desired applications.***

Note that ***most of commands/utilities are not a part of Linux***, they are just small programs/applications developed by the community. For example, you can install MinGW to use Linux commands in Windows and you can also develop your own commands. 

To launch the shell in interactive mode, simply open the terminal 

<img src="image-20220504204923409.png" alt="image-20220504204923409" style="zoom:50%;" />

To run a shell script, give it executable premession `chmod +x show_kernel_version.sh`  and then run it. 

```bash
#!/usr/local/bin/zsh
uname -r
```

The script file `show_kernel_version.sh` (in fact, the extension name is not important, since `#!` token will tell the shell which shell to use). 

<img src="image-20220504205520230.png" alt="image-20220504205520230" style="zoom: 50%;" />

This is all about Linux 101. 

Learn more **Linux utilities** by `man` and `--help` or `-h` commands. 

[What's the difference betwen the single dash and double dash flags on shell commands? - Server Fault](https://serverfault.com/questions/387935/whats-the-difference-betwen-the-single-dash-and-double-dash-flags-on-shell-comm)

> A single hyphen can be followed by multiple single-character flags. A double hyphen prefixes a single, multicharacter option.
>
> ```
> tar -h 
> tar --help
> ```

Keep in mind,  **Linux utilities** are not a part of Linux. 

