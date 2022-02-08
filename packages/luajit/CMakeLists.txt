#${CMAKE_DL_LIBS} is needed when using luajit
cmake_parse_arguments(
    "USING_PACKAGE_LUAJIT"
    "" "VERSION" "LUA_VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
ExternalProject_Add (
    luajit-external
    GIT_REPOSITORY https://luajit.org/git/luajit.git
    GIT_TAG v${USING_PACKAGE_LUAJIT_VERSION}
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${Make}
    INSTALL_COMMAND ${Make} install PREFIX=<INSTALL_DIR> INSTALL_ANAME=libluajit.a
    ${ExternalProjectArgs}
)
add_package(luajit luajit-external STATICS luajit)
target_link_libraries(luajit INTERFACE ${CMAKE_DL_LIBS})
