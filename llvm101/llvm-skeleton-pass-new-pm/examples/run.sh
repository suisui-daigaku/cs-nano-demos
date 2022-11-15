# clang -flegacy-pass-manager -Xclang -load -Xclang ../build/lib/libHelloWorldPass.so for_bar.c 



rm -f example.exe

if [ ! -f ../lib/libHelloWorldPass.dylib ];then
    echo "File not found! CMake and then Make" && exit 1
fi


if [[ "$OSTYPE" == "linux"* ]]; then
    clang -fpass-plugin=../lib/libHelloWorldPass.so for_bar.c -o example.exe
elif [[ "$OSTYPE" == "darwin"* ]]; then
    clang -fpass-plugin=../lib/libHelloWorldPass.dylib for_bar.c -o example.exe
else
     echo "Operating System is not supported!" && exit 1
fi

