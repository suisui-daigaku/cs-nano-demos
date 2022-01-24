cmake_minimum_required(VERSION 3.1)

# project name 
# project(LLVMHello)
set(LLVM_VERSION "12" CACHE STRING "LLVM Version")
set(LLVM_VERSION_SUFFIX "-${LLVM_VERSION}")


# Obtain the build flags from `llvm-config --cxxflags` and forward them to
# variable CMAKE_CXX_FLAGS.
execute_process(COMMAND llvm-config${LLVM_VERSION_SUFFIX} --cxxflags
                OUTPUT_VARIABLE LLVM_CXXFLAGS
                OUTPUT_STRIP_TRAILING_WHITESPACE)
set(CMAKE_CXX_FLAGS "${LLVM_CXXFLAGS} -Wall -Werror")
set(CMAKE_CXX_CLANG_TIDY clang-tidy${LLVM_VERSION_SUFFIX})

# add passes under the current project... 
add_subdirectory(Hello) 

