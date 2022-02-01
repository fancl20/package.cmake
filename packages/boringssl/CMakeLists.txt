cmake_parse_arguments(
    "USING_PACKAGE_BORINGSSL"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
ExternalProject_Add (
    boringssl-external
    DEPENDS ninja
    URL https://github.com/google/boringssl/archive/${USING_PACKAGE_BORINGSSL_VERSION}.zip
    CMAKE_GENERATOR Ninja
    BUILD_COMMAND ${PackageRun} ninja
    INSTALL_COMMAND ${CMAKE_COMMAND} -E copy <SOURCE_DIR>/ssl/libssl.a <INSTALL_DIR>/lib/
    COMMAND ${CMAKE_COMMAND} -E copy <SOURCE_DIR>/crypto/libcrypto.a <INSTALL_DIR>/lib/
    COMMAND ${CMAKE_COMMAND} -E  copy_directory <SOURCE_DIR>/include <INSTALL_DIR>/include/
    ${ExternalProjectArgs}
)
add_package(boringssl boringssl-external
    STATICS ssl crypto
)
