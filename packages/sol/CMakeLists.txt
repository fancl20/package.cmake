include(../misc.cmake)
ExternalProject_Add (
    sol-${version}-external
    URL https://github.com/ThePhD/sol2/archive/v${version}.zip
    CONFIGURE_COMMAND cmake -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR> .
    BUILD_IN_SOURCE 1
)
add_package(sol sol-${version}-external)