cmake_parse_arguments(
    "USING_PACKAGE_LUA"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
ExternalProject_Add (
    lua-external
    URL https://www.lua.org/ftp/lua-${USING_PACKAGE_LUA_VERSION}.tar.gz
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${Make} posix
    INSTALL_COMMAND ${Make} install INSTALL_TOP=<INSTALL_DIR>
    ${ExternalProjectArgs} 
)
add_package(lua lua-external STATICS lua)