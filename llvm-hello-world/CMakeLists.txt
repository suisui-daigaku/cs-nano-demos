# ==============================================================================
# LLVM Pass:  https://github.com/quarkslab/llvm-passes/blob/master/CMakeLists.txt
# LLVM Tutor: https://github.com/banach-space/llvm-tutor/blob/main/CMakeLists.txt
# LLVM Pathces : https://github.com/intel/llvm-patches/blob/master/CMakeLists.txt
# SGX Example: 
# SGX CMake : https://github.com/xzhangxa/SGX-CMake/blob/master/sample/CMakeLists.txt
# ==============================================================================


cmake_minimum_required(VERSION 3.13.4)
project(llvm-tutorial)
#===============================================================================
# 1. VERIFY LLVM INSTALLATION DIR
# This is just a bit of a sanity checking.
#===============================================================================

# Use the command llvm-config to find LLVM install prefix....
# execute_process(COMMAND llvm-config --prefix
#                RESULT_VARIABLE STATUS
#                OUTPUT_VARIABLE LT_LLVM_INSTALL_DIR
#                OUTPUT_STRIP_TRAILING_WHITESPACE
#                ERROR_QUIET)
# if(STATUS AND NOT STATUS EQUAL 0)
#   message(FATAL_ERROR "LLVM may be not installed as llvm-config is not a valid command.") 
# endif()

# tell CMake where LLVM is 
#   https://github.com/banach-space/llvm-tutor#building
set(LT_LLVM_INSTALL_DIR "" CACHE PATH "LLVM installation directory")
set(LT_LLVM_INCLUDE_DIR "${LT_LLVM_INSTALL_DIR}/include/llvm")

# if not specified, then run llvm-config
if(NOT EXISTS "${LT_LLVM_INCLUDE_DIR}")
  message(FATAL_ERROR "The value -DLT_LLVM_INSTALL_DIR given to CMake is invalid. Please clean the CMakeCache and Re-built. The command llvm-config --prefix may help.")
endif()

# cmake and its LLVMConfig.cmake 
list(APPEND CMAKE_PREFIX_PATH "${LT_LLVM_INSTALL_DIR}/lib/cmake/llvm/")

#===============================================================================
# 2. LOAD LLVM CONFIGURATION
#    For more: http://llvm.org/docs/CMake.html#embedding-llvm-in-your-project
#===============================================================================

# SGX is required (please disable if the machine does not support SGX)
# find_package(SGX REQUIRED)

# LLVM configuration for using CMake 
find_package(LLVM 14.0.0 REQUIRED CONFIG)
if(NOT "14" VERSION_EQUAL "${LLVM_VERSION_MAJOR}")
  message(FATAL_ERROR "Found LLVM ${LLVM_VERSION_MAJOR}, but need LLVM 14")
endif()

# message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
# message(STATUS "Using LLVMConfig.cmake in: ${CMAKE_PREFIX_PATH}")
# message("LLVM STATUS:
#   Definitions ${LLVM_DEFINITIONS}
#   Includes    ${LLVM_INCLUDE_DIRS}
#   Libraries   ${LLVM_LIBRARY_DIRS}
#   Targets     ${LLVM_TARGETS_TO_BUILD}"
# )

# get regular includes
include(LLVMConfig)
include(HandleLLVMOptions)
include(AddLLVM)

#  Now set the header and library paths:
include_directories(SYSTEM ${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})
add_definitions(${LLVM_DEFINITIONS})


#===============================================================================
# 3. LLVM-TUTOR BUILD CONFIGURATION
#===============================================================================
# Use the same C++ standard as LLVM does 
set(CMAKE_CXX_STANDARD 14 CACHE STRING "")

# Build type
if (NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug CACHE STRING "Build type (default Debug):" FORCE)
endif()

# Compiler flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fdiagnostics-color=always -Wall -Werror -Wno-unused-function")

# LLVM is normally built without RTTI. Be consistent with LLVM 
if(NOT LLVM_ENABLE_RTTI)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")
endif()

# only Intel has SGX, we force the it to X86
set(LLVM_TARGETS_TO_BUILD "X86" CACHE STRING "Intel SGX as target machine" FORCE)

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR)
  message(FATAL_ERROR "In-source builds are not allowed. ")
endif()

# Set the build directories
# set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/bin")
# set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/lib")

#===============================================================================
# 4. ADD SUB-TARGETS
# Doing this at the end so that all definitions and link/include paths are
# available for the sub-projects.
#===============================================================================
#add_subdirectory(lib)
#add_subdirectory(tools)
add_subdirectory(HelloWorld)

# =============================================
# auto testing to verify the passes 
# =============================================
# include(CTest)
# enable_testing()
# add_subdirectory(test)

