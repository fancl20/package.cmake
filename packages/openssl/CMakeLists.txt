set (OpenSSLConfigureCommand config)
if (APPLE)
    set (OpenSSLConfigureCommand Configure darwin64-x86_64-cc enable-ec_nistp_64_gcc_128)
endif ()
string(REPLACE "." "_" tag "${version}")
ExternalProject_Add (
    openssl-${version}-external
    URL https://github.com/openssl/openssl/archive/OpenSSL_${tag}.zip
    CONFIGURE_COMMAND ./${OpenSSLConfigureCommand} no-zlib no-shared enable-cms --prefix=<INSTALL_DIR>
    INSTALL_COMMAND ${Make} install_sw
    ${ExternalProjectArgs} 

)
add_package(openssl openssl-${version}-external 
    STATICS ssl crypto
)
