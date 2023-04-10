#!/bin/bash

# - 
# - BOOTSTRAP=nocc ./case.sh 


case "$BOOTSTRAP" in
nocc)	pkgname="musl-dev"; subpackages="";;
nolibc) ;;
*)	subpackages="$subpackages $pkgname-utils";;
esac

printf "%s\n%s\n" "$pkgname" "$subpackages"

