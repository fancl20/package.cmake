string(REPLACE "." "_" tag "${version}")
ExternalProject_Add (
    cares-${version}-external
    URL https://github.com/c-ares/c-ares/archive/cares-${tag}.zip
    CONFIGURE_COMMAND
        COMMAND ./buildconf
        COMMAND ./configure --disable-shared --prefix=<INSTALL_DIR>
    ${ExternalProjectArgs} 
)
add_package(cares cares-${version}-external STATICS cares)