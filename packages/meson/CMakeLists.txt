cmake_parse_arguments(
    "USING_PACKAGE_MESON"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
ExternalProject_Add (
    meson-external
    URL https://github.com/mesonbuild/meson/archive/${USING_PACKAGE_MESON_VERSION}.tar.gz
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ${CMAKE_COMMAND} -E create_symlink <SOURCE_DIR>/meson.py <INSTALL_DIR>/bin/meson
    ${ExternalProjectArgs} 
)
add_package(meson meson-external)