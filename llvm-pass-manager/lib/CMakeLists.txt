
add_library(PassManagerHelloWorld SHARED
        Analysis.cpp 
        Transform.cpp
        AnotherTransform.cpp
)

target_link_libraries(PassManagerHelloWorld
        "$<$<PLATFORM_ID:Linux,Windows>:-shared>"
        "$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>"
)


# Allow undefined symbols in shared objects on Darwin (this is the default behaviour on Linux)
# Get proper shared-library behavior (where symbols are not necessarily resolved when the shared library is linked) on OS X.
#******************************************************************************
#* NOTE: 
#*   The global LLVM configuration and build configuration have been set up 
#*   in the top-level directory CMakeList.txt. Only need to specify the 
#*   target setting in this subdiretory/dependency
#******************************************************************************
#===============================================================================
# 3. ADD THE TARGET
#===============================================================================
# 其他写法避免出现共用动态库在静态编译时无法找到符号的问题(除了最后阶段？)
# --------------------------------------------------------------------------------------------------------------------------
# Get proper shared-library behavior (where symbols are not necessarily resolved when the shared library is linked) on OS X.
# if(APPLE)
#    set_target_properties(HelloWorld PROPERTIES
#        LINK_FLAGS "-undefined dynamic_lookup"
#    )
# endif(APPLE)



