ExternalProject_Add (
    lua-${version}-external
    URL https://www.lua.org/ftp/lua-${version}.tar.gz
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${Make} posix
    INSTALL_COMMAND ${Make} install INSTALL_TOP=<INSTALL_DIR>
    ${ExternalProjectArgs} 
)
add_package(lua lua-${version}-external STATICS lua)