cmake_parse_arguments(
    "USING_PACKAGE_LEVELDB"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
ExternalProject_Add (
    leveldb-external
    URL https://github.com/google/leveldb/archive/refs/tags/${USING_PACKAGE_LEVELDB_VERSION}.zip
    CMAKE_CACHE_ARGS
        "-DLEVELDB_BUILD_TESTS:BOOL=OFF"
        "-DLEVELDB_BUILD_BENCHMARKS:BOOL=OFF"
    ${ExternalProjectArgs}
)
add_package(leveldb leveldb-external STATICS leveldb)