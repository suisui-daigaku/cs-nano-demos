

```bash
case "$BOOTSTRAP" in
nocc)	pkgname="musl-dev"; subpackages="";;
nolibc) ;;
*)	subpackages="$subpackages $pkgname-utils";;
esac
```