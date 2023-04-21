
# top-level directory = root directory 
cmake_minimum_required(VERSION 3.12)
project(ProjectName)

message("$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>")
