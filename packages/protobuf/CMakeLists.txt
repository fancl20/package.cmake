cmake_parse_arguments(
    "USING_PACKAGE_PROTOBUF"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
ExternalProject_Add (
    protobuf-external
    URL https://github.com/google/protobuf/archive/v${USING_PACKAGE_PROTOBUF_VERSION}.zip
    SOURCE_SUBDIR cmake
    CMAKE_ARGS "-Dprotobuf_BUILD_TESTS:BOOL=OFF"
    ${ExternalProjectArgs} 
)
add_package(protobuf protobuf-external
    STATICS protobuf protobuf-lite protoc
)