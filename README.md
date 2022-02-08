# Use CMake as a package manager

## Example

Use `using` to add a package into you project and use `target_link_libraries` to link (also add include directories) to you target.

```cmake
cmake_minimum_required(VERSION 3.18)
project(project_name)

set(CMAKE_CXX_STANDARD 17)
add_subdirectory(package.cmake)

using(ninja VERSION 1.10.2)
using(absl VERSION 20211102.0)
using(re2 VERSION 2021-11-01)
using(zlib VERSION 1.2.11)
using(boringssl VERSION a9670a8b476470e6f874fef3554e8059683e1413)
using(cares VERSION 1_18_1)
using(protobuf VERSION 3.19.1)
using(grpc VERSION 1.41.1)
using(grpcgen 
    PROTO_PATH ${PROJECT_SOURCE_DIR}
    PROTO_FILES
        path/to/proto/file1.proto
        path/to/proto/file2.proto
)
find_package(Threads REQUIRED)

add_executable(main main.cpp)
target_compile_options(main PRIVATE
    -O2 -g -Wall -Wextra -Werror
)
target_link_libraries(main
    grpcgen
    grpc::grpc++_unsecure protobuf::protobuf boringssl cares zlib
    Threads::Threads
)
```

The above example add `grpc` and its dependencies. `openssl` include 2 libs (libssl.a and libcrypto.a). You can specify a lib in openssl by using `openssl::ssl` or `openssl::crypto`.

## Add package to repo

See the previous packages.

* With lib: lua
* With multiple libs: openssl
* Header only: sol
* With dependent package: grpc (using the dependent packages before using grpc)
