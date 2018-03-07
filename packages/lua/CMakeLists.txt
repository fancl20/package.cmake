function(Add_Target target version hash)
    ExternalProject_Add (
        lua-${version}-external
        URL https://www.lua.org/ftp/lua-${version}.tar.gz
        URL_MD5 ${hash}
        CONFIGURE_COMMAND ""
        BUILD_COMMAND make posix
        BUILD_IN_SOURCE 1
        INSTALL_COMMAND make install INSTALL_TOP=<INSTALL_DIR>
    )
    add_package(${target} lua-${version}-external IMPORTED_LOCATION liblua.a)
endfunction()

Add_Target(lua::5.3 5.3.4 53a9c68bcc0eda58bdc2095ad5cdfc63)
Add_Target(lua::5.2 5.2.4 913fdb32207046b273fdb17aad70be13)

add_library(lua ALIAS lua::5.3)
