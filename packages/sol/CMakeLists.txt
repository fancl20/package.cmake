ExternalProject_Add (
    sol-2.19.5-external
    URL https://github.com/ThePhD/sol2/archive/v2.19.5.zip
    URL_MD5 a9748c48c7784cc6ec496d320b3fdc0f
    CONFIGURE_COMMAND cmake -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR> .
    BUILD_IN_SOURCE 1
)
add_package(sol::2.19 sol-2.19.5-external)

add_library(sol ALIAS sol::2.19)
