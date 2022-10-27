# Define the project
project(trie-test)

# GoogleTest requires at least C++11
set(CMAKE_CXX_STANDARD 11)

# Add definition for math library
add_library(Trie Trie.cpp)

# Add definition for the cmake-tutorial binary
add_executable(trie-test test)
target_link_libraries(trie-test Trie)
