cmake_parse_arguments(
    "USING_PACKAGE_NINJA"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
ExternalProject_Add (
    ninja-external
    URL https://github.com/ninja-build/ninja/archive/refs/tags/v${USING_PACKAGE_NINJA_VERSION}.zip
    ${ExternalProjectArgs}
)
add_package(ninja ninja-external)