cmake_parse_arguments(
    "USING_PACKAGE_SNAPPY"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
find_package(Patch REQUIRED)
ExternalProject_Add (
    snappy-external
    DEPENDS Patch::patch
    URL https://github.com/google/snappy/archive/refs/tags/${USING_PACKAGE_SNAPPY_VERSION}.zip
    PATCH_COMMAND ${Patch_EXECUTABLE} --input=${CMAKE_CURRENT_SOURCE_DIR}/001-fix-inline.patch
    CMAKE_CACHE_ARGS
        "-DSNAPPY_BUILD_TESTS:BOOL=OFF"
        "-DSNAPPY_BUILD_BENCHMARKS:BOOL=OFF"
    ${ExternalProjectArgs}
)
add_package(snappy snappy-external STATICS snappy)