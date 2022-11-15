set(LLVM_TUTOR_PLUGINS
    DynamicCallCounter
    OpcodeCounter
    RIV
    StaticCallCounter
)

set(DynamicCallCounter_SOURCES DynamicCallCounter.cpp)
set(OpcodeCounter_SOURCES OpcodeCounter.cpp)
set(RIV_SOURCES RIV.cpp)
set(StaticCallCounter_SOURCES StaticCallCounter.cpp)

# 
foreach(plugin ${LLVM_TUTOR_PLUGINS}) 
    add_library(
        ${plugin}
        SHARED
        ${${plugin}_SOURCES}
    )

    target_include_directories(
        ${plugin}
        PRIVATE
        "${PROJECT_SOURCE_DIR}/include"
    )

    target_link_libraries(
            ${plugin} "$<$<PLATFORM_ID:Linux,Windows>:-shared>"
                      "$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>"
    )

endforeach()
