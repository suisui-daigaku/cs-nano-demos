# Assignment 0 Introduction to Docker

Note

Please feel free to skip this section if you are working on the MathLab machines @[mathlab.utsc.utoronto.ca](https://github.com/haohua-li/CSCD70/blob/2021S/Assignment0-Introduction_to_Docker/mathlab.utsc.utoronto.ca) as they already have all the necessary software components installed.

- [Introduction](https://github.com/haohua-li/CSCD70/tree/2021S/Assignment0-Introduction_to_Docker#introduction)
- Instructions
  - [Docker](https://github.com/haohua-li/CSCD70/tree/2021S/Assignment0-Introduction_to_Docker#docker)
  - [Docker-Compose](https://github.com/haohua-li/CSCD70/tree/2021S/Assignment0-Introduction_to_Docker#docker-compose)
- [References](https://github.com/haohua-li/CSCD70/tree/2021S/Assignment0-Introduction_to_Docker#references)

## [Introduction](https://github.com/haohua-li/CSCD70/tree/2021S/Assignment0-Introduction_to_Docker#id5)

Docker runs our applications in a **lightweight** *container* by using the *image* that has all the necessary software components installed. Think of it as conda or virtualenv (both are used to as an containerized Python environment), but at a broader scope for almost all software libraries. Compared with the virtual machines, Docker has negligible performance overhead [[1\]](https://github.com/haohua-li/CSCD70/tree/2021S/Assignment0-Introduction_to_Docker#id3), making itself an ideal solution for software development.

[<img src="https://raw.githubusercontent.com/haohua-li/photo-asset-repo/main/imgs/68747470733a2f2f646f63732e646f636b65722e636f6d2f696d616765732f436f6e7461696e657225343032782e706e67.png" alt="img" style="zoom: 33%;" />](https://camo.githubusercontent.com/61cacff58886865ab31663877517526e5450535c901884c661023dd177573f61/68747470733a2f2f646f63732e646f636b65722e636f6d2f696d616765732f436f6e7461696e657225343032782e706e67) [<img src="https://raw.githubusercontent.com/haohua-li/photo-asset-repo/main/imgs/68747470733a2f2f646f63732e646f636b65722e636f6d2f696d616765732f564d25343032782e706e67.png" alt="img" style="zoom:33%;" />](https://camo.githubusercontent.com/2f4adea837e319904a8bd37e41e82ea53132df8b78aa14ac730dd3281df85096/68747470733a2f2f646f63732e646f636b65722e636f6d2f696d616765732f564d25343032782e706e67)

[[2\]](https://github.com/haohua-li/CSCD70/tree/2021S/Assignment0-Introduction_to_Docker#id4)

## [Instructions](https://github.com/haohua-li/CSCD70/tree/2021S/Assignment0-Introduction_to_Docker#id6)

### [Docker](https://github.com/haohua-li/CSCD70/tree/2021S/Assignment0-Introduction_to_Docker#id7)

- **Download and Install Docker**:

  | Windows: | https://hub.docker.com/editions/community/docker-ce-desktop-windows |
  | -------- | ------------------------------------------------------------ |
  | Mac:     | https://hub.docker.com/editions/community/docker-ce-desktop-mac |
  | Ubuntu:  | https://docs.docker.com/install/linux/docker-ce/ubuntu/      |

- **Build the Docker image**:

  - An *image* is an isolated environment that includes all necessary software components.
  - 创建 Docker Image 最重要的是 `Dockerfile` 文件，可以看一看目录下的 `Dockerfile` ，里面包含了所有需要的组件。

  ```bash
  # Build the docker image from file Dockerfile and tag (-t) it with name `cscd70:2021S`.
  cd Assignment0-Introduction_to_Docker
  docker build . -t cscd70:2021S
  ```

- **Create a Docker container**:

  - A *container* is an instantiation of an image. Multiple containers can be created out of the same image.

  ```bash
  # Create a container for the first assignment.
  cd Assignment1-Introduction_to_LLVM/FunctionInfo
  docker run -it -v $(pwd):/mnt --rm --name cscd70_a1 cscd70:2021S
  ```

  | -t     | Allocate a pseudo terminal.                                  |
  | ------ | ------------------------------------------------------------ |
  | -i     | Connect to STDIN (i.e., keyboard).                           |
  | -v     | Mount the current working directory (i.e., `FunctionInfo`) to `/mnt` in the container. |
  | --rm   | (Optional) Cleanup the container when we exit.               |
  | --name | (Optional) Name of the Container                             |

  - Note that:
    1. `-it` must be used jointly for an interactive bash shell,
    2. Any changes made natively in the mounted directory will be reflected in the container as well (and vice versa). The mounted directory must be in **absolute path**.
    3. The image name (i.e., `cscd70:2021S`) should always come last.

- **Run the experiments**:

  ```bash
  cd /mnt
  mkdir build && cd build
  cmake .. && make
  ```



### [Docker-Compose](https://github.com/haohua-li/CSCD70/tree/2021S/Assignment0-Introduction_to_Docker#id8)

Docker-Compose is a simple wrapper on top of the docker commands. There is a docker-compose file provided in the root folder of the [GitHub repo](https://github.com/UofT-EcoSystem/CSCD70). We can do the same things as we have previously described, but much simpler:

```
# Install docker-compose via python-pip.
pip3 install docker-compose

docker-compose build cscd70-dev     # Build the image.
docker-compose run --rm cscd70-dev  # Create a container.
```



## [References](https://github.com/haohua-li/CSCD70/tree/2021S/Assignment0-Introduction_to_Docker#id9)

| [[1\]](https://github.com/haohua-li/CSCD70/tree/2021S/Assignment0-Introduction_to_Docker#id1) | https://stackoverflow.com/a/26149994/6320608 |
| ------------------------------------------------------------ | -------------------------------------------- |
|                                                              |                                              |

| [[2\]](https://github.com/haohua-li/CSCD70/tree/2021S/Assignment0-Introduction_to_Docker#id2) | https://docs.docker.com/get-started/ |
| ------------------------------------------------------------ | ------------------------------------ |
|                                                              |                                      |