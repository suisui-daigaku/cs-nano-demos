# APKBUILD of Alpine: Build a Package 

应该是模仿 ArchLinux 的 PKGBUILD 

> A `PKGBUILD` is a shell script containing the build information required by Arch Linux packages.
> Packages in Arch Linux are built using the [makepkg](https://wiki.archlinux.org/title/Makepkg) utility. When makepkg is run, it searches for a PKGBUILD file in the current directory and follows the instructions therein to either compile or otherwise acquire the files to build a package archive (pkgname.pkg.tar.zst). The resulting package contains binary files and installation instructions, readily installable with pacman.

大意是如果要构建一个安装包的话，需要写一个 `PKGBUILD` 供 makepkg 工具使用。
也就是如果要学会写 `PKGBUILD` 可以打包自己需要的程序。

https://wiki.alpinelinux.org/wiki/Creating_an_Alpine_package

https://www.matthewparris.org/build-an-alpine-package/

Building / consuming alpine Linux packages inside containers and images https://itsufficient.me/blog/alpine-build 

[TOC]

## Exmaple 1: Reposerve 

### What will Build 

Building / consuming alpine Linux packages inside containers and images <https://itsufficient.me/blog/alpine-build> 

### Build Environment 

create a `tmp` directory in the current working directory on macOS

```bash 
mkdir tmp 
```

run an alpine container (interative mode and virtual volum)

```bash 
docker run --interactive --tty --volume "$(pwd)/tmp:/home/packager" alpine:3.16 sh 
```

prepare `abuild` dependencies 

```bash 
# install essentials apk package
apk add sudo build-base alpine-sdk
# create a packager user and add him to sudo list
adduser -D packager
addgroup packager abuild
echo 'packager ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/packager
# then open an sh as packager user
sudo -u packager sh
```

> **Note**: the symbol `#`  will be changed to `$` if switching from root user to normal user. 

generate a pair of keys 

```bash 
abuild-keygen -n --append --install
```


### Create the Package 

```bash 
# navigate to 'packager's home directory 
cd 
# create a APKBUILD 
mkdir -p reposerve/main/reposerve
# create ​APKBUILD
touch /home/​packager/​reposerve/​main/​reposerve/​APKBUILD
```

In the file `/home/packager/reposerve/main/reposerve/​APKBUILD`

```bash 
# Maintainer: Eric BURGHARD <eric@itsufficient.me>
pkgname=reposerve
pkgver=0.5.0
pkgrel=0
pkgdesc="Simple alpine packages server for consuming and updating packages in CI/CD"
url="https://git.itsufficient.me/rust/reposerve"
arch="x86_64"
license="ASL 2.0"
makedepends="cargo clang-dev llvm-dev"
depends="abuild"
source="$pkgname-$pkgver.tar.gz::https://github.com/eburghar/reposerve/archive/refs/tags/$pkgver.tar.gz"

build() {
  cargo build --release
}

check() {
  cargo test all --release
}

package() {
  install -Dm755 target/release/"$pkgname" \
    "$pkgdir"/usr/bin/"$pkgname"
}

sha512sums="
d20c5fb5d9f769add480e4897f63565d8240005df9e7fa316a22a380c2eeac258e41476ec6936d0af4ea51e6f0639316448ba06c586ab08b3c321601fe3abb87  reposerve-0.5.0.tar.gz
"
```

> **Note**: the directory structure is important because `abuild` expects that the parent of the current directiory containing the `APKBUILD` corresponds 
> to the name of a package repositry (main). 

> **Note**: [aports projetc](https://github.com/alpinelinux/aports) contains all the packages

> **Warning**: the original source code is modified, the checksum/sha512sums may be suspensive. 

Run the code 

```bash 
cd /home/packager/reposerve/main/reposerve
# REPODEST is set to add an additional level in package directories to represent alpine version
# the command `abuild -r` will make package and output to `tmp` directory
REPODEST=~/packages/3.17 abuild -r
```

The reposerve binary is packaged in `/home/packager/packages/3.17/main/x86_64/reposerve-0.5.0-r0.apk`


### Install the Package 

Exit the previous container and start another container 

```bash
docker run --rm --interactive --tty --volume "$(pwd)/tmp:/home/packager" alpine:3.16 sh
```

Copy the public key generated in previous steps in apk keys' directory, then install the packages locally. 

```bash
cp /home/packager/.abuild/*.rsa.pub /etc/apk/keys/
apk add /home/packager/packages/3.17/main/x86_64/reposerve-0.5.0-r0.apk
```

Now verify the package works 

```bash
reposerve --help
```

```
reposerve 0.5.0

Usage: reposerve [-c <config>] [-d] [-v] [-a <addr>]

Simple Alpine Linux packages server

Options:
  -c, --config      configuration file (/etc/reposerve.yaml)
  -d, --dev         dev mode: enable /webhook and /upload without jwt (false)
  -v, --verbose     more detailed output (false)
  -a, --addr        addr:port to bind to (0.0.0.0:8080)
  --help            display usage information
```

### Build an Image 

Create a `Dockerfile` 

```dockerfile
FROM alpine:3.17

# you should change this line to match the keys' filenames generated on previous step
COPY .abuild/packager-622b138b.rsa.pub \
  .abuild/packager-622b138b.rsa \
  /etc/apk/keys/
COPY packages/3.17/main/x86_64/reposerve-0.5.0-r0.apk \
  /tmp/

RUN apk add alpine-sdk tini \
  /tmp/reposerve-0.5.0-r0.apk

ENTRYPOINT ["tini", "--", "/usr/bin/reposerve"]
```


## Example 2: modified musl-dev 

alpine 3.16 uses musl-dev at https://git.alpinelinux.org/aports/tree/main/musl?h=3.16-stable

To clone the project 

```bash
git clone --branch 3.16-stable https://github.com/alpinelinux/aports.git
```

> **Note**: 此处可能需要代理。推荐使用 HTTP 协议的代理。
> 详细搜索 macOS terminal socks5 http proxy 设置。

