cmake_parse_arguments(
    "USING_PACKAGE_HIREDIS"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)

ExternalProject_Add (
    hiredis-external
    GIT_REPOSITORY https://github.com/redis/hiredis.git
    GIT_TAG v${USING_PACKAGE_HIREDIS_VERSION}
    ${ExternalProjectArgs}
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${Make} PREFIX=<INSTALL_DIR>
    INSTALL_COMMAND ${Make} install PREFIX=<INSTALL_DIR>
)
add_package(hiredis hiredis-external STATICS)
