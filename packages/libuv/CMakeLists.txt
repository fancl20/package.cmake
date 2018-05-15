ExternalProject_Add (
    libuv-${version}-external
    URL https://github.com/libuv/libuv/archive/v${version}.zip
    CONFIGURE_COMMAND 
        COMMAND ./autogen.sh
        COMMAND ./configure --disable-shared --enable-static --prefix=<INSTALL_DIR>
    ${ExternalProjectArgs} 
)
add_package(libuv libuv-${version}-external STATICS uv)