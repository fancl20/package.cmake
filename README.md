# Use CMake as a package manager

## Example

Use `target_link_libraries` to link (also add include directories) to you target.

```cmake
add_subdirectory(package.cmake)

set_property(DIRECTORY PROPERTY EP_BASE ${CMAKE_CURRENT_BINARY_DIR}/external_build)
add_compile_options(-O2 -g -std=c++14 -Wall -Wextra -Werror)

add_executable(main test.cpp)
target_link_libraries(main lua sol)
```

The above example add `lua` and `sol` as dependencies. You can specify version by lua::5.2 if that version is available.

## Add package to repo

See the previous packages.

* With lib: lua
* Header only: sol
