
add_subdirectory(HelloWorld)

# add_subdirectory(Analysis)
# add_subdirectory(Transforms)
# add_subdirectory(Target)


# # THE LIST OF PLUGINS AND THE CORRESPONDING SOURCE FILES
# # ======================================================
# set(LLVM_TUTOR_PLUGINS
#         OpcodeCounter
#         InjectFuncCall
#         StaticCallCounter
#         DynamicCallCounter
#         MBASub
#         RIV
#         FindFCmpEq
#         RemoveUnreachableFunctions
# )

# set(OpcodeCounter_SOURCES OpcodeCounter.cpp)
# set(InjectFuncCall_SOURCES InjectFuncCall.cpp)
# set(StaticCallCounter_SOURCES StaticCallCounter.cpp)
# set(DynamicCallCounter_SOURCES DynamicCallCounter.cpp)
# set(MBASub_SOURCES MBASub.cpp)
# set(RIV_SOURCES RIV.cpp)
# set(FindFCmpEq_SOURCES FindFCmpEq.cpp)
# set(RemoveUnreachableFunctions_SOURCES RemoveUnreachableFunctions.cpp)


# # CONFIGURE THE PLUGIN LIBRARIES
# # ==============================
# foreach(plugin ${LLVM_TUTOR_PLUGINS}) # traverse each item in the LLVM_TUTOR_PLUGINS as `plugin`
#     # create a library corresponding to each item (namely `plugin`)
#     add_library(
#         ${plugin}
#         SHARED
#         ${${plugin}_SOURCES}
#     )

#     # configure include directories for 'plugin'
#     target_include_directories(
#         ${plugin}
#         PRIVATE
#         "${PROJECT_SOURCE_DIR}/include"
#     )

#     # On Darwin (unlike on Linux), undefined symbols in shared objects are not allowed at the end of the link-edit.
#     # The plugins defined here:
#     #  - are shared objects
#     #  - reference symbols from LLVM shared libraries, i.e. symbols which are
#     #    undefined until those shared objects are loaded in memory (and hence
#     #    `undefined` during static linking)
#     # The build will fail with errors like this:
#     #    "Undefined symbols for architecture x86_64"
#     # With various LLVM symbols being undefined.
#     # Since those symbols are later loaded and resolved at runtime, these errors are false positives (strict).
#     # This behaviour can be solved via the '-undefined' OS X linker flag as follows.
#     # ---------------------------------------------------------------------------------------------------
#     # CMakeの使い方（その２）
#     # https://qiita.com/shohirose/items/637f4b712893764a7ec1
#     # プラットフォーム・コンパイラによってオプションを変更する
#     # CMakeにはプラットフォーム・コンパイラを識別するための変数が用意されているのでif...elseを使って簡単に実現できます。
#     # --------------------------------------------------------------------------------------------------
#     # 如何为 Clang 编译器写插件实现自动化重构 - netcan
#     # https://netcan.github.io/2020/08/07/%E5%A6%82%E4%BD%95%E4%B8%BAClang%E7%BC%96%E8%AF%91%E5%99%A8%E5%86%99%E6%8F%92%E4%BB%B6%E5%AE%9E%E7%8E%B0%E8%87%AA%E5%8A%A8%E5%8C%96%E9%87%8D%E6%9E%84/
#     # ---------------------------------------------------------------------------------------------------
#     target_link_libraries(
#             ${plugin} "$<$<PLATFORM_ID:Linux,Windows>:-shared>"
#                       "$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>"
#     )

# endforeach()
