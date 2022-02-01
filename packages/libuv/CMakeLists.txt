cmake_parse_arguments(
    "USING_PACKAGE_LIBUV"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
ExternalProject_Add (
    libuv-external
    URL https://github.com/libuv/libuv/archive/refs/tags/v${USING_PACKAGE_LIBUV_VERSION}.zip
    CONFIGURE_COMMAND 
        COMMAND ./autogen.sh
        COMMAND ./configure --disable-shared --enable-static --prefix=<INSTALL_DIR>
    ${ExternalProjectArgs}
)
add_package(libuv libuv-external STATICS uv)