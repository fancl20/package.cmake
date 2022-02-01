cmake_parse_arguments(
    "USING_PACKAGE_GFLAGS"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
ExternalProject_Add (
    gflags-external
    URL https://github.com/gflags/gflags/archive/refs/tags/v${USING_PACKAGE_GFLAGS_VERSION}.zip
    ${ExternalProjectArgs}
)
add_package(gflags gflags-external STATICS gflags)