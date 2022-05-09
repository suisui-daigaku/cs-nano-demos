# Docker RAM

有时候 Docker Container 可能需要巨大的内存。

[Docker Container Memory & CPU Limit: Set Up and Manage Resources (phoenixnap.com)](https://phoenixnap.com/kb/docker-memory-and-cpu-limit)

- 比如有的时候可能需要十几个容器 (k8)
- 在容器里面 build 东西 

[【转】Docker 运行时资源限制-内存memory、交换机分区Swap、CPU_Docker猫猫的博客-CSDN博客_docker swap](https://blog.csdn.net/CSDN_duomaomao/article/details/78567859)

[Runtime options with Memory, CPUs, and GPUs | Docker Documentation](https://docs.docker.com/config/containers/resource_constraints/)

> 如果不设置`-m,--memory`和`--memory-swap`，容器默认可以用完宿舍机的所有内存和 swap 分区。



