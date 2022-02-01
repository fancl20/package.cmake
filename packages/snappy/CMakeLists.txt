cmake_parse_arguments(
    "USING_PACKAGE_SNAPPY"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
ExternalProject_Add (
    snappy-external
    URL https://github.com/google/snappy/archive/refs/tags/${USING_PACKAGE_SNAPPY_VERSION}.zip
    CMAKE_CACHE_ARGS
        "-DSNAPPY_BUILD_TESTS:BOOL=OFF"
        "-DSNAPPY_BUILD_BENCHMARKS:BOOL=OFF"
    ${ExternalProjectArgs}
)
add_package(snappy snappy-external STATICS snappy)