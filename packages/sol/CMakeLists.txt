cmake_parse_arguments(
    "USING_PACKAGE_SOL"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
ExternalProject_Add (
    sol-external
    URL https://github.com/ThePhD/sol2/archive/v${USING_PACKAGE_SOL_VERSION}.zip
    ${ExternalProjectArgs} 
)
add_package(sol sol-external)