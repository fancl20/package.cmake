function(Add_Target target version hash)
    ExternalProject_Add (
        sol-${version}-external
        URL https://github.com/ThePhD/sol2/archive/v${version}.zip
        URL_MD5 ${hash}
        CONFIGURE_COMMAND cmake -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR> .
        BUILD_IN_SOURCE 1
    )
    add_package(${target} sol-${version}-external)
endfunction()

Add_Target(sol::2.19 2.19.5 a9748c48c7784cc6ec496d320b3fdc0f)

add_library(sol ALIAS sol::2.19)
