# Assignment 1 Introduction to LLVM [![handout](https://img.shields.io/badge/-handout-blue)](https://www.overleaf.com/read/nvmnmbntgwqn)

[CSCD70/Assignment1-Introduction_to_LLVM at 2021S · UofT-EcoSystem/CSCD70 (github.com)](https://github.com/UofT-EcoSystem/CSCD70/tree/2021S/Assignment1-Introduction_to_LLVM)

---

```bash
mkdir build & cd build 
CC=/usr/local/bin/clang CXX=/usr/local/bin/clang++ cmake -DLT_LLVM_INSTALL_DIR="/usr/local" ..
```

Note that **macOS** will not allow undefined symbols in compile time (but at runtime, these undefined symbols could be meaningful as LLVM allows us to dynamically load passes), so we have to add `-undefined dynamic_lookup` to the target flag. See more in `FunctionInfo/lib/CMakeLists.txt `
