cmake_parse_arguments(
    "USING_PACKAGE_ZLIB"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
ExternalProject_Add (
    zlib-external
    URL https://zlib.net/zlib-${USING_PACKAGE_ZLIB_VERSION}.tar.gz
    ${ExternalProjectArgs}
)
add_package(zlib zlib-external STATICS z)