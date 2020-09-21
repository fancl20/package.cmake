cmake_parse_arguments(
    "USING_PACKAGE_RE2"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
ExternalProject_Add (
    re2-external
    URL https://github.com/google/re2/archive/${USING_PACKAGE_RE2_VERSION}.zip
    CMAKE_CACHE_ARGS
        "-DRE2_BUILD_TESTING:BOOL=OFF"
    ${ExternalProjectArgs} 
)
add_package(re2 re2-external
    STATICS re2
)