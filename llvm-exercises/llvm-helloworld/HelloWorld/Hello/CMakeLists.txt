add_library(LLVMHello MODULE
    # List your source files here.  
    Hello.cpp
)   

# Use C++11 to compile our pass (i.e., supply -std=c++11).
# set(CMAKE_CXX_STANDARD 17)
target_compile_features(LLVMHello PRIVATE cxx_range_for cxx_auto_type)

# LLVM is (typically) built with no C++ RTTI. We need to match that.
#   more details in https://llvm.org/docs/HowToSetUpLLVMStyleRTTI.html
#   > LLVM avoids using C++’s built in RTTI. 
#   > Instead, it pervasively uses its own hand-rolled form of RTTI which is much more efficient and flexible, 
#   > although it requires a bit more work from you as a class author.
set_target_properties(LLVMHello PROPERTIES
    COMPILE_FLAGS "-fno-rtti"
)

# Get proper shared-library behavior (where symbols are not necessarily
# resolved when the shared library is linked) on OS X.
if(APPLE)
    set_target_properties(LLVMHello PROPERTIES
        LINK_FLAGS "-undefined dynamic_lookup"
    )
endif(APPLE)




