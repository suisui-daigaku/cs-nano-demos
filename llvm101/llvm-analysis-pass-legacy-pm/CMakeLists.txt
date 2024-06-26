# ==============================================================================
# LLVM Pass:  https://github.com/quarkslab/llvm-passes/blob/master/CMakeLists.txt
# LLVM Tutor: https://github.com/banach-space/llvm-tutor/blob/main/CMakeLists.txt
# LLVM CSCD70: https://github.com/UofT-EcoSystem/CSCD70/blob/2021S/Assignment1-Introduction_to_LLVM/FunctionInfo/CMakeLists.txt
# LLVM Pathces : https://github.com/intel/llvm-patches/blob/master/CMakeLists.txt
# LLVM Cmake https://netcan.github.io/2020/08/07/%E5%A6%82%E4%BD%95%E4%B8%BAClang%E7%BC%96%E8%AF%91%E5%99%A8%E5%86%99%E6%8F%92%E4%BB%B6%E5%AE%9E%E7%8E%B0%E8%87%AA%E5%8A%A8%E5%8C%96%E9%87%8D%E6%9E%84/
# SGX Example: 
# SGX CMake : https://github.com/xzhangxa/SGX-CMake/blob/master/sample/CMakeLists.txt
# ==============================================================================


cmake_minimum_required(VERSION 3.13.4)
project(llvm-pass-manager-hello-world)
#===============================================================================
# 1. VERIFY LLVM INSTALLATION DIR
# This is just a bit of a sanity checking.
#===============================================================================
# tell CMake where LLVM is 
#   https://github.com/banach-space/llvm-tutor#building
set(LT_LLVM_INSTALL_DIR "" CACHE PATH "LLVM installation directory")


# LLVM installation validation....
set(LT_LLVM_INCLUDE_DIR "${LT_LLVM_INSTALL_DIR}/include/llvm")
if(NOT EXISTS "${LT_LLVM_INCLUDE_DIR}")
  message(STATUS "The value -DLT_LLVM_INSTALL_DIR is not specified. Use llvm-config --prefix instead.")
  # Obtain the build flags from `llvm-config --cxxflags` and forward them to variable CMAKE_CXX_FLAGS.
  execute_process(COMMAND llvm-config --prefix
          OUTPUT_VARIABLE LLVMCONFIG_INSTALL_PREFIX
          OUTPUT_STRIP_TRAILING_WHITESPACE)
  # set(CMAKE_CXX_FLAGS "${LLVM_CXXFLAGS} -Wall -Werror")
  # set(CMAKE_CXX_CLANG_TIDY clang-tidy${LLVM_VERSION_SUFFIX})
  set(LT_LLVM_INSTALL_DIR "${LLVMCONFIG_INSTALL_PREFIX}" CACHE PATH "LLVM installation directory" FORCE)
  message(STATUS "found LLVM installed at ${LT_LLVM_INSTALL_DIR}")
endif()

# 1.2 Check that the LLVMConfig.cmake file exists (the location depends on the OS)
set(LT_VALID_INSTALLATION FALSE)

# for Ubuntu + Darwin
if(EXISTS "${LT_LLVM_INSTALL_DIR}/lib/cmake/llvm/LLVMConfig.cmake")
  set(LT_VALID_INSTALLATION TRUE)
endif()

# whether the LLVM cmake configuration is available....
if(NOT ${LT_VALID_INSTALLATION})
  message(FATAL_ERROR
          "LLVM installation directory, (${LT_LLVM_INSTALL_DIR}), is invalid. Couldn't find LLVMConfig.cmake.")
endif()


#===============================================================================
# 2. LOAD LLVM CONFIGURATION
#    For more: http://llvm.org/docs/CMake.html#embedding-llvm-in-your-project
#===============================================================================
# Add the location of LLVMConfig.cmake to CMake search paths (so that
# find_package can locate it)
# Note: On Fedora, when using the pre-compiled binaries installed with `dnf`,
# LLVMConfig.cmake is located in "/usr/lib64/cmake/llvm". But this path is
# among other paths that will be checked by default when using
# `find_package(llvm)`. So there's no need to add it here.
list(APPEND CMAKE_PREFIX_PATH "${LT_LLVM_INSTALL_DIR}/lib/cmake/llvm/")


# SGX is required (please disable if the machine does not support SGX)
# find_package(SGX REQUIRED)

# LLVM configuration for using CMake 
find_package(LLVM 14 REQUIRED CONFIG)
find_package(Clang REQUIRED CONFIG)

# LLVM version checking...
if(NOT "14" VERSION_EQUAL "${LLVM_VERSION_MAJOR}")
  message(FATAL_ERROR "Found LLVM ${LLVM_VERSION_MAJOR}, but need LLVM 13")
endif()

# only Intel has SGX, we force the it to X86
set(LLVM_TARGETS_TO_BUILD "X86" CACHE STRING "Intel SGX as target machine" FORCE)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${CMAKE_PREFIX_PATH}")
message("LLVM STATUS:
  Definitions ${LLVM_DEFINITIONS}
  Includes    ${LLVM_INCLUDE_DIRS}
  Libraries   ${LLVM_LIBRARY_DIRS}
  Targets     ${LLVM_TARGETS_TO_BUILD}"
)

# LLVM include header files
#  (https://cmake.org/cmake/help/latest/variable/CMAKE_OSX_SYSROOT.html)
#  https://netcan.github.io/2020/08/07/%E5%A6%82%E4%BD%95%E4%B8%BAClang%E7%BC%96%E8%AF%91%E5%99%A8%E5%86%99%E6%8F%92%E4%BB%B6%E5%AE%9E%E7%8E%B0%E8%87%AA%E5%8A%A8%E5%8C%96%E9%87%8D%E6%9E%84/
include_directories(SYSTEM ${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

# LLVM binary executable files
link_directories(${LLVM_LIBRARY_DIRS})

#===============================================================================
# 3. LLVM-TUTOR BUILD CONFIGURATION
#===============================================================================
# make sure the building in 'build' directory.
if(CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR)
  message(FATAL_ERROR "In-source builds are not allowed. ")
endif()

# Use the same C++ standard as LLVM does 
set(CMAKE_CXX_STANDARD 14 CACHE STRING "")

# Build type
if (NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug CACHE STRING "Build type (default Debug):" FORCE)
endif()

# Compiler flags (warning something..)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fdiagnostics-color=always -Wall -Werror -Wno-unused-function")

# LLVM is normally built without RTTI. Be consistent with LLVM 
if(NOT LLVM_ENABLE_RTTI)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")
endif()

# -fvisibility-inlines-hidden is set when building LLVM and on Darwin warnings
# are triggered if llvm-tutor is built without this flag (though otherwise it
# builds fine). For consistency, add it here too.
include(CheckCXXCompilerFlag)
check_cxx_compiler_flag("-fvisibility-inlines-hidden" SUPPORTS_FVISIBILITY_INLINES_HIDDEN_FLAG)
if (${SUPPORTS_FVISIBILITY_INLINES_HIDDEN_FLAG} EQUAL "1")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility-inlines-hidden")
endif()

# Set the build directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/bin")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/lib")



#===============================================================================
# 4. ADD SUB-TARGETS
# Doing this at the end so that all definitions and link/include paths are
# available for the sub-projects.
#===============================================================================
# 教程中比较有用的 Pass
# -------------------------------------
add_subdirectory(lib)
#add_subdirectory(tools)
#add_subdirectory(test)
