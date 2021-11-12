cmake_parse_arguments(
    "USING_PACKAGE_LIBFUSE"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
ExternalProject_Add (
    libfuse-external
    DEPENDS meson ninja
    URL https://github.com/libfuse/libfuse/archive/fuse-${USING_PACKAGE_LIBFUSE_VERSION}.zip
    CONFIGURE_COMMAND ${PackageRun} meson <SOURCE_DIR>
    BUILD_COMMAND ${PackageRun} ninja
    INSTALL_COMMAND ${PackageRun} DESTDIR=<INSTALL_DIR> ninja install
    INSTALL_DIR ${installDir}
)
add_package(libfuse libfuse-external)