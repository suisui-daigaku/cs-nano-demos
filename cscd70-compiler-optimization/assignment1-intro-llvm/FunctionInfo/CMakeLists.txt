cmake_minimum_required(VERSION 3.12.0)
project(FunctionInfo)
 
set(LT_LLVM_INSTALL_DIR "" CACHE PATH "LLVM installation directory")
list(APPEND CMAKE_PREFIX_PATH "${LT_LLVM_INSTALL_DIR}/lib/cmake/llvm/")

find_package(LLVM 14 REQUIRED CONFIG)
find_package(Clang REQUIRED CONFIG)
include_directories(SYSTEM ${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})
link_directories(${LLVM_LIBRARY_DIRS})
set(CMAKE_CXX_STANDARD 14 CACHE STRING "")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fdiagnostics-color=always -Wall -Werror -Wno-unused-function")


add_subdirectory(lib)  # Build the shared library libFunctionInfo.so.
include(CTest)
enable_testing()
add_subdirectory(test)

file(GLOB_RECURSE SRC_FILEs "*.h" "*.cpp")
add_custom_target(format WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
                         COMMAND clang-format${LLVM_VERSION_SUFFIX} -i ${SRC_FILEs})
