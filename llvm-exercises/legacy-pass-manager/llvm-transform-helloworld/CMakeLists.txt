cmake_minimum_required(VERSION 3.1)

# project name 
project(LLVMHello)

# tell CMake where LLVM is 
# (otherwise VS Code will keep complaining LLVM headers not found)
#   https://stackoverflow.com/questions/57780600/how-is-cmake-finding-my-llvm-cmake-configuration
#   https://stackoverflow.com/questions/30867712/add-llvm-to-project-using-cmake
find_package(LLVM REQUIRED CONFIG) # find some configration about LLVM ? like $LLVM_DEFINITIONS, $LLVM_INCLUDE_DIRS...
add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})

add_subdirectory(Hello) # the subdirectory is your Pass toy..... 