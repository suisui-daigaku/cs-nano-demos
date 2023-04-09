
# cmake . 

project(HelloWorld)
cmake_minimum_required(VERSION 3.0)

if(DEFINED DEBUG)
    add_compile_definitions(DEBUG=${DEBUG})
    message("DEBUG flag is ${DEBUG}")
endif()


add_executable(hello_world main.cpp)