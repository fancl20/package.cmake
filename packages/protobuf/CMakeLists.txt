ExternalProject_Add (
    protobuf-${version}-external
    URL https://github.com/google/protobuf/archive/v${version}.zip
    SOURCE_SUBDIR cmake
    CMAKE_ARGS "-Dprotobuf_BUILD_TESTS:BOOL=OFF"
    ${ExternalProjectArgs} 
)
add_package(protobuf protobuf-${version}-external
    STATICS protobuf protobuf-lite protoc
)