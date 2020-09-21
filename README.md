# Use CMake as a package manager

## Example

Use `using` to add a package into you project and use `target_link_libraries` to link (also add include directories) to you target.

```cmake
set(CMAKE_CXX_STANDARD 20)
add_subdirectory(package.cmake)

using(absl VERSION 20200225.2)
using(re2 VERSION 2020-08-01)
using(zlib VERSION 1.2.11)
using(openssl VERSION 1_1_1g)
using(cares VERSION 1_16_1)
using(protobuf VERSION 3.13.0)
using(grpc VERSION 1.32.0)
using(grpcgen 
    PROTO_PATH ${PROJECT_SOURCE_DIR}
    PROTO_FILES
        path/to/proto/file1.proto
        path/to/proto/file2.proto
)
find_package(Threads REQUIRED)

add_executable(main main.cpp)
target_compile_options(main PRIVATE
    -O2 -g -std=c++20 -Wall -Wextra -Werror
)
target_link_libraries(main
    grpc::grpc++_unsecure protobuf::protobuf openssl cares zlib
    Threads::Threads
))
```

The above example add `grpc` and its dependencies. `openssl` include 2 libs (libssl.a and libcrypto.a). You can specify a lib in openssl by using `openssl::ssl` or `openssl::crypto`.

## Add package to repo

See the previous packages.

* With lib: lua
* With multiple libs: openssl
* Header only: sol
* With dependent package: grpc (using the dependent packages before using grpc)
