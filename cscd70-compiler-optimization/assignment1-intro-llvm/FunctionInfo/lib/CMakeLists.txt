add_library(FunctionInfo SHARED FunctionInfo.cpp)

target_link_libraries(FunctionInfo
        "$<$<PLATFORM_ID:Linux,Windows>:-shared>"
        "$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>"
)