# Dockerfile

[使用 Dockerfile 定制镜像 | Docker 从入门到实践 (docker-practice.com)](https://vuepress.mirror.docker-practice.com/image/build/#run-执行命令)

## 单层镜像

```dockerfile
FROM ubuntu:20.04

RUN apt update
RUN apt install -y gcc libc6-dev make wget
RUN wget -O redis.tar.gz "http://download.redis.io/releases/redis-5.0.3.tar.gz"
RUN mkdir -p /usr/src/redis
RUN tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1
RUN make -C /usr/src/redis
RUN make -C /usr/src/redis install
```

这个安装脚本会出问题

- 编译过程出现大量临时 `obj` 文件
- 每一行代码都是一层镜像，而 Union FS 有最大层数限制
- 更新的软件包等等被装入镜像，镜像回会非常臃肿

 正确的做法是把上面**提到的7层合并为1层 **(把所有 `RUN` 合并)

```dockerfile
FROM ubuntu:20.04

# build redis 
RUN set -x; buildDeps='gcc libc6-dev make wget' \
    && apt-get update \
    && apt-get install -y $buildDeps \
    && wget -O redis.tar.gz "http://download.redis.io/releases/redis-5.0.3.tar.gz" \
    && mkdir -p /usr/src/redis \
    && tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1 \
    && make -C /usr/src/redis \
    && make -C /usr/src/redis install \
    && rm -rf /var/lib/apt/lists/* \
    && rm redis.tar.gz \
    && rm -r /usr/src/redis \
    && apt-get purge -y --auto-remove $buildDeps
```

> 此外，还可以看到这一组命令的最后添加了清理工作的命令，**删除了为了编译构建所需要的软件，清理了所有下载、展开的文件，并且还清理了 `apt` 缓存文件。**
>
> 镜像是多层存储，每一层的东西并不会在下一层被删除，会一直跟随着镜像。因此镜像构建时，一定要确保每一层只添加真正需要添加的东西，任何无关的东西都应该清理掉。

## 构建镜像

```dockerfile
FROM nginx:latest
RUN echo '<h1>Hello, Docker!</h1>' > /usr/share/nginx/html/index.html
```

在构建镜像后，可以发现

```bash
$ docker build -t randoruf/redis:7.0 .
Sending build context to Docker daemon 2.048 kB
Step 1 : FROM nginx:1.21.6
 ---> e43d811ce2f4
Step 2 : RUN echo '<h1>Hello, Docker!</h1>' > /usr/share/nginx/html/index.html
 ---> Running in 9cdc27646c7b
 ---> 44aa4490ce2c
Removing intermediate container 9cdc27646c7b
Successfully built 44aa4490ce2c
```

首先启动了 `9cdc27646c7b` 容器，执行了所要求的命令后，

提交了 `44aa4490ce2c` 这一层，删除临时容器  `9cdc27646c7b`， 最后创建镜像。

## 镜像的上下文 Context 

注意 docker 只有 `.` 符号，这是因为 docker enginer 本质是 server (docker 可以是 local, 也是 remote) .

这里的 `.` 指的是上下文路径 (是可以指定的，但默认是 `.dockerfile` 下的目录)

这个 `.` 仅仅只是一个符号，不是 Linux 的 `.` 相对路径。

## 多种格式构建 Docker 

- 使用本地文件 (把文件复制到 dockerfile 目录下)
- 使用 docker hub 
- 使用 Git Repo 
- 使用 tar 压缩包
- 使用标准输入
  - 灵活运用 redirect `>`  和 管道 `|`
  - 从标准输入中读取上下文压缩包进行构建

## Docker 指令

#### [COPY 复制文件 - Docker — 从入门到实践 (gitbook.io)](https://yeasy.gitbook.io/docker_practice/image/dockerfile/copy)

#### [ADD 更高级的复制文件 - Docker — 从入门到实践 (gitbook.io)](https://yeasy.gitbook.io/docker_practice/image/dockerfile/add)

#### [CMD 容器启动命令 - Docker — 从入门到实践 (gitbook.io)](https://yeasy.gitbook.io/docker_practice/image/dockerfile/cmd)

> Docker 不是虚拟机，容器就是进程。
>
> 既然是**进程**，那么在启动容器的时候，需要指定所**运行的程序及参数**。`CMD` 指令就是用于指定默认的容器主进程的启动命令的。
>
> 提到 `CMD` 就不得不提容器中应用在前台执行和后台执行的问题。
>
> Docker 不是虚拟机，容器中的应用都应该以前台执行，而不是像虚拟机、物理机里面那样，用 `systemd` 去启动后台服务，容器内没有后台服务的概念。甚至在容器内去使用 `systemctl` 命令结果却发现根本执行不了。这就是因为没有搞明白前台、后台的概念，没有区分容器和虚拟机的差异，依旧在以传统虚拟机的角度去理解容器。
>
> ***对于容器而言，其启动程序就是容器应用进程，容器就是为了主进程而存在的，主进程退出，容器就失去了存在的意义，从而退出，其它辅助进程不是它需要关心的东西。***
>
> 比如 `CMD service nginx start` 的本质是 `CMD [ "sh", "-c", "service nginx start"]`
>
> 进程的主体是 `sh` ，当 `sh` 结束时，容器就自然结束了。
>
> 正确的做法是直接执行 `nginx` 可执行文件，并且要求以前台形式运行
>
> ```bash
> CMD ["nginx", "-g", "daemon off;"]
> ```
>
> [linux - How to run Nginx within a Docker container without halting? - Stack Overflow](https://stackoverflow.com/questions/18861300/how-to-run-nginx-within-a-docker-container-without-halting)
>
> (这就是为什么推荐 exec 格式，可以让你清楚自己在做什么)
>
> (前台就是有交互的，后台就是没有直接交互的)

#### [ENTRYPOINT 入口点 - Docker — 从入门到实践 (gitbook.io)](https://yeasy.gitbook.io/docker_practice/image/dockerfile/entrypoint)

***场景一：让镜像变成像命令一样使用***

> 注意 `CMD` 在 docker 镜像被调用时，可能**会被后面的参数调换**，比如
>
> ```dockerfile
> FROM ubuntu:18.04
> RUN apt-get update \
>     && apt-get install -y curl \
>     && rm -rf /var/lib/apt/lists/*
> CMD [ "curl", "-s", "http://myip.ipip.net" ]
> ```
>
>  使用 `docker build -t myip .` 创建镜像
>
> ```bash
> $ docker run myip
> 当前 IP：61.148.226.66 来自：北京市 联通
> ```
>
> 但是 `docker run myip -i` 会被解析为
>
> ```dockerfile
> CMD ["-i"]
> ```
>
> (后面的 command 会直接替换 CMD 的默认值)
>
> 如果使用 `ENTRYPOINT` ， 那么 docker run 后面的 `"<CMD>"` 会被直接加到 `<ENTRYPOINT> ` 后面
>
> ```dockerfile
> FROM ubuntu:18.04
> RUN apt-get update \
>     && apt-get install -y curl \
>     && rm -rf /var/lib/apt/lists/*
> ENTRYPOINT [ "curl", "-s", "http://myip.ipip.net" ]
> ```
>
> 而 docker run 后面的 `<CMD> ` 此时为 `-i`
>
> ```bash
> docker run myip -i
> ```
>
> 所以 `<ENTRYPOINT> <CMD>` 会被解析为
>
> ```dockerfile
> ENTRYPOINT [ "curl", "-s", "http://myip.ipip.net" ]:["-i"] 
> ```

***场景二：应用运行前的准备工作***

> 在正式运行 `CMD` 的进程之前，需要先进行一些准备工作。
>
> 此时可以利用 `ENTRYPOINT` 作为程序的入口，最后才去**启动主进程**。
>
> 这种情况下，可以写一个脚本，然后放入 `ENTRYPOINT` 中去执行，而这个脚本会将接到的参数（也就是 `<CMD>`）作为命令，在脚本最后执行。
>
> 比如官方镜像 `redis` 中就是这么做的：
>
> ```dockerfile
> FROM alpine:3.4
> ...
> RUN addgroup -S redis && adduser -S -G redis redis # 创建 redis 用户
> ...
> ENTRYPOINT ["docker-entrypoint.sh"] # 
> 
> EXPOSE 6379
> CMD [ "redis-server" ]
> ```
>
> 可以看到其中为了 redis 服务创建了 redis 用户，并在最后指定了 `ENTRYPOINT` 为 `docker-entrypoint.sh` 脚本。
>
> ```sh
> #!/bin/sh
> ...
> # allow the container to be started with `--user`
> if [ "$1" = 'redis-server' -a "$(id -u)" = '0' ]; then
> 	find . \! -user redis -exec chown redis '{}' +
> 	exec gosu redis "$0" "$@"
> fi
> 
> exec "$@"
> ```
>
> 该脚本的内容就是根据 `<CMD>` 的内容来判断，如果是 `redis-server` 的话，则切换到 `redis` 用户身份启动服务器，否则依旧使用 `root` 身份执行。比如
>
> ```sh
> $ docker run -it redis id
> uid=0(root) gid=0(root) groups=0(root)
> 
> $ docker run -it redis redis-server
> ....?????
> ```

#### [ENV 设置环境变量 - Docker — 从入门到实践 (gitbook.io)](https://yeasy.gitbook.io/docker_practice/image/dockerfile/env)

比如 `ENV CC=/bin/clang`， 后面可以 `"$CC"` 看看这个环境变量。

 
