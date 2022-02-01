cmake_parse_arguments(
    "USING_PACKAGE_CARES"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
ExternalProject_Add (
    cares-external
    URL https://github.com/c-ares/c-ares/archive/refs/tags/cares-${USING_PACKAGE_CARES_VERSION}.zip
    CMAKE_CACHE_ARGS
        "-DCARES_STATIC:BOOL=ON"
        "-DCARES_SHARED:BOOL=OFF"
        "-DCARES_BUILD_TOOLS:BOOL=OFF"
    ${ExternalProjectArgs}
)
add_package(cares cares-external STATICS cares)