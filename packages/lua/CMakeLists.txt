include(../misc.cmake)
ExternalProject_Add (
    lua-${version}-external
    URL https://www.lua.org/ftp/lua-${version}.tar.gz
    CONFIGURE_COMMAND ""
    BUILD_COMMAND make posix
    BUILD_IN_SOURCE 1
    INSTALL_COMMAND make install INSTALL_TOP=<INSTALL_DIR>
)
add_package(lua lua-${version}-external STATICS lua)