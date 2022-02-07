#${CMAKE_DL_LIBS} is needed when using luajit
cmake_parse_arguments(
    "USING_PACKAGE_LUAJIT"
    "" "VERSION" "LUA_VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
ExternalProject_Add (
    luajit-external
    GIT_REPOSITORY https://luajit.org/git/luajit.git
    GIT_TAG ${USING_PACKAGE_LUAJIT_VERSION}
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${Make} CC=${CMAKE_C_COMPILER} -j$(nproc)
    INSTALL_COMMAND ${Make} install PREFIX="" DESTDIR=<INSTALL_DIR>
    ${ExternalProjectArgs}
)

add_package(luajit luajit-external STATICS luajit-${USING_PACKAGE_LUAJIT_LUA_VERSION})
