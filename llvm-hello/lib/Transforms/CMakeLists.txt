set(LLVM_TUTOR_PLUGINS
    InjectFuncCall
    MBASub
)

set(InjectFuncCall_SOURCES InjectFuncCall.cpp)
set(MBASub_SOURCES MBASub.cpp)

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
