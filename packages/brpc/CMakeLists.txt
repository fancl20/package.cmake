cmake_parse_arguments(
    "USING_PACKAGE_BRPC"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
ExternalProject_Add (
    brpc-external
    DEPENDS gflags snappy leveldb protobuf openssl::ssl
    URL https://github.com/apache/incubator-brpc/archive/refs/tags/${USING_PACKAGE_BRPC_VERSION}.zip
    CMAKE_CACHE_ARGS
        "-DDOWNLOAD_GTEST:BOOL=OFF"
    ${ExternalProjectArgs}
)
add_package(brpc brpc-external STATICS brpc)