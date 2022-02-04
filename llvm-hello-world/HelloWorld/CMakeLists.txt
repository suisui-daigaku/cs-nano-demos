#******************************************************************************
#* NOTE: 
#*   The global LLVM configuration and build configuration have been set up 
#*   in the top-level directory CMakeList.txt. Only need to specify the 
#*   target setting in this subdiretory/dependency
#******************************************************************************


#===============================================================================
# 1. LOAD LLVM CONFIGURATION
#===============================================================================
# Set this to a valid LLVM installation dir
# set(LT_LLVM_INSTALL_DIR "" CACHE PATH "LLVM installation directory")

# Add the location of LLVMConfig.cmake to CMake search paths (so that find_package can locate it)
# list(APPEND CMAKE_PREFIX_PATH "${LT_LLVM_INSTALL_DIR}/lib/cmake/llvm/")

# FIXME: This is a warkaround for #25. Remove once resolved and use find_package(LLVM 11.0.0 REQUIRED CONFIG) instead.
# find_package(LLVM REQUIRED CONFIG)

# HelloWorld includes headers from LLVM - update the include paths accordingly
# include_directories(SYSTEM ${LLVM_INCLUDE_DIRS})

#===============================================================================
# 2. LLVM-TUTOR BUILD CONFIGURATION
#===============================================================================
# Use the same C++ standard as LLVM does
# set(CMAKE_CXX_STANDARD 14 CACHE STRING "")

# LLVM is normally built without RTTI. Be consistent with that.
# if(NOT LLVM_ENABLE_RTTI)
#  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")
# endif()


#===============================================================================
# 3. ADD THE TARGET
#===============================================================================

add_library(HelloWorld SHARED
        # List your source files here.
        HelloWorld.cpp
)
# Allow undefined symbols in shared objects on Darwin (this is the default behaviour on Linux)
target_link_libraries(HelloWorld
        "$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>")


# --------------------------------------------------------------------------------------
# Remove the function f3...
add_library(RemoveUnreachableFunctionsOLD SHARED # List your source files here.
        RemoveUnreachableFunctionsOLD.cpp
        )
target_link_libraries(RemoveUnreachableFunctionsOLD
        "$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>")


# Get proper shared-library behavior (where symbols are not necessarily resolved when the shared library is linked) on OS X.
# if(APPLE)
#    set_target_properties(HelloWorld PROPERTIES
#        LINK_FLAGS "-undefined dynamic_lookup"
#    )
# endif(APPLE)



