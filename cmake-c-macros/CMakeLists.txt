
# cmake . 

project(HelloWorld)
cmake_minimum_required(VERSION 3.0)

if(DEFINED OE_HEAP_ALLOTTED_PAGE_COUNT)
    add_compile_definitions(OE_HEAP_ALLOTTED_PAGE_COUNT=${OE_HEAP_ALLOTTED_PAGE_COUNT})
    message("OE heap usage is limited to ${OE_HEAP_ALLOTTED_PAGE_COUNT} pages")
else()
    # set default as 32 MB for sgxlkl-oe
    add_compile_definitions(OE_HEAP_ALLOTTED_PAGE_COUNT=8192)
    message("OE heap usage is limited to 8192 pages")
endif()


add_executable(hello_world main.cpp)