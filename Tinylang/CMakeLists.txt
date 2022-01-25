#*************************************************************************
# The Tinylang CMake building script. 
# on Jan 25 2021 
# Partially from 
#   - ikos https://github.com/NASA-SW-VnV/ikos/blob/master/CMakeLists.txt
#   - Learn LLVM 12 https://github.com/PacktPublishing/Learn-LLVM-12/blob/master/Chapter02/tinylang/CMakeLists.txt
#*************************************************************************

cmake_minimum_required(VERSION 3.13.4)
# The top-level CMakeLists.txt file must contain a literal (project name). 
project(Tinylang)

# the source directory to cmake is correct (the main project is tinylang). 
if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
    # search the LLVM and add the LLVM to the CMake module path 
    find_package(LLVM REQUIRED HINTS "${LLVM_CMAKE_PATH}")
    list(APPEND CMAKE_MODULE_PATH ${LLVM_DIR})
    # CMake moudles provided by LLVM 
    include(AddLLVM)
    include(HandleLLVMOptions)
    # add the header files (part of) from LLVM to the include search path 
    include_directories("${LLVM_BINARY_DIR}/include" "${LLVM_INCLUDE_DIR}")
    # the LLVM libraries (dynanmic?) is added for the linker.  
    link_directories("${LLVM_LIBRARY_DIR}")

    set(TINYLANG_BUILT_STANDALONE 1)
endif()

# to add our own CMake modules 
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")

# to build files in a seperate directory (e.g. ./build/) to avoid any conflicts 
if (CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR)
  message(FATAL_ERROR "In-source builds are not allowed.")
endif()
 
# 
set(TINYLANG_VERSION_STRING "0.1")
configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/include/tinylang/Basic/Version.inc.in
  ${CMAKE_CURRENT_BINARY_DIR}/include/tinylang/Basic/Version.inc)

# 
include(AddTinylang)

# 