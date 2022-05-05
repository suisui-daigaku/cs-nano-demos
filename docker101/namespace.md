# Linux Namespace

[Linux Namespace 特性简要介绍 - 晒太阳的猫 (zhengyinyong.com)](https://zhengyinyong.com/post/introduction-to-linux-namespace/)

inux 内核提供了[ 7 种不同的 Namespace](http://man7.org/linux/man-pages/man7/namespaces.7.html)，如下所示：

| Namespace | `clone()` 使用的 flag | 所隔离的资源                 |
| --------- | --------------------- | ---------------------------- |
| Cgroup    | `CLONE_NEWCGROUP`     | Cgroup 根目录                |
| IPC       | `CLONE_NEWIPC`        | System V IPC，POSIX 消息队列 |
| Network   | `CLONE_NEWNET`        | 网络设备、协议栈、端口等     |
| Mount     | `CLONE_NEWNS`         | 挂载点                       |
| PID       | `CLONE_NEWPID`        | 进程 ID                      |
| User      | `CLONE_NEWUSER`       | 用户和组 ID                  |
| UTS       | `CLONE_NEWUTS`        | 主机名和域名                 |

就是**在资源上打上名字**，有点像小学生在自己的文具上写名字。

