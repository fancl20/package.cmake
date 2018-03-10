# Use CMake as a package manager

## Example

Use `using` to add a package into you project and use `target_link_libraries` to link (also add include directories) to you target.

```cmake
add_subdirectory(package.cmake)
include(using)

using(zlib 1.2.11)
using(openssl 1.0.2n)
using(cares 1.14.0)
using(protobuf 3.5.2)
using(grpc 1.10.0)

add_executable(main test.cpp)
target_compile_options(main PRIVATE
    -O2 -g -std=c++14 -Wall -Wextra -Werror
)
target_link_libraries(main
    grpc::grpc++_unsecure protobuf::protobuf openssl cares zlib
))
```

The above example add `grpc` and its dependencies. `openssl` include many libs (libssl.a and libcrypto.a). You can specify a lib in openssl by using `openssl::ssl` or `openssl::crypto`.

## Add package to repo

See the previous packages.

* With lib: lua
* With multiple libs: openssl
* Header only: sol
* With dependent package: grpc (using the dependent packages before using grpc)

## TODO

* Add package compile options: using(openssl ZLIB)
