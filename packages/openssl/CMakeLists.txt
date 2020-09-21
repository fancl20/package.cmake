cmake_parse_arguments(
    "USING_PACKAGE_OPENSSL"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
set(OpenSSLConfigureCommand config)
if(APPLE)
    set(OpenSSLConfigureCommand Configure darwin64-x86_64-cc enable-ec_nistp_64_gcc_128)
endif()
ExternalProject_Add (
    openssl-external
    URL https://github.com/openssl/openssl/archive/OpenSSL_${USING_PACKAGE_OPENSSL_VERSION}.zip
    CONFIGURE_COMMAND ./${OpenSSLConfigureCommand} no-zlib no-shared enable-cms --prefix=<INSTALL_DIR>
    INSTALL_COMMAND ${Make} install_sw
    ${ExternalProjectArgs} 

)
add_package(openssl openssl-external 
    STATICS ssl crypto
)
