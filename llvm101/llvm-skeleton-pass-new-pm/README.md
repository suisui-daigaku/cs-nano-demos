# llvm-pass-skeleton for New Pass Manager 


## Prepare LLVM 

Install LLVM by Homebrew 

```
brew install llvm
```

Show the Xcode SDK

```
xcrun --sdk macosx --show-sdk-path
```

For example, `/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX13.0.sdk`

Open `~/.zshrc`

```
### LLVM 
export SDKROOT='/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX13.0.sdk'
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LIBRARY_PATH="$LIBRARY_PATH:$SDKROOT/usr/lib"
```

More details at <https://stackoverflow.com/questions/56156520/gfortran-error-ld-library-not-found-for-lsystem-when-trying-to-compile>



## Build the Plugin 

```
cmake .
make
```


## Play a test 

```
cd examples
clang -fpass-plugin=../lib/libHelloWorldPass.dylib for_bar.c -o example.exe
```

> **NOTE**: the library file may be `libHelloWorldPass.so` on Linux. 

