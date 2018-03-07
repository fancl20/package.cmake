cmake_minimum_required(VERSION 3.11)

add_subdirectory(packages EXCLUDE_FROM_ALL)

# TO BE REMOVED

set_property(DIRECTORY PROPERTY EP_BASE ${CMAKE_CURRENT_BINARY_DIR}/external_build)

add_compile_options(-O2 -g -std=c++14 -Wall -Wextra -Werror)
add_executable(main test.cpp)
target_link_libraries(main lua sol)