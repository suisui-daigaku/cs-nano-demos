# Difference between CMAKE_CURRENT_SOURCE_DIR & CMAKE_SOURCE_DIR variables?
#   https://stackoverflow.com/questions/53195186/difference-between-cmake-current-source-dir-cmake-source-dir-variables

# top-level directory = root directory 
cmake_minimum_required(VERSION 3.12)

# The top-level CMakeLists.txt file must contain a literal (project name). 
project(CMakeSourceDir)

message("In the top-level directory CMakeLists.txt: ")
message("   root dir CMAKE_SOURCE_DIR = ${CMAKE_SOURCE_DIR}")
message("   root dir CMAKE_CURRENT_SOURCE_DIR = ${CMAKE_CURRENT_SOURCE_DIR}")

# the dependency to the main program (they have their own current source directory)
add_subdirectory(sub1)
add_subdirectory(sub2)

