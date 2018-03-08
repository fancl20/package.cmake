# Use CMake as a package manager

## Example

Use `using` to add a package into you project and use `target_link_libraries` to link (also add include directories) to you target.

```cmake
add_subdirectory(package.cmake)
include(using)

using(lua 5.3.4)
using(openssl 1.0.2n)
using(sol 2.19.5)

set_property(DIRECTORY PROPERTY EP_BASE ${CMAKE_CURRENT_BINARY_DIR}/external_build)
add_compile_options(-O2 -g -std=c++14 -Wall -Wextra -Werror)

add_executable(main main.cpp)
target_link_libraries(main lua sol openssl)
```

The above example add `lua`,`sol` an `openssl` as dependencies. `openssl` include 2 libs (libssl.a and libcrypto.a). You can specify a lib in openssl by using `openssl::ssl` or `openssl::crypto`.

## Add package to repo

See the previous packages.

* With lib: lua
* With multiple libs: openssl
* Header only: sol
* With PATCH:
* Depend on other lib:
