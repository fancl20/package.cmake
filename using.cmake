cmake_minimum_required(VERSION 3.11)

function(using pkg version)
    get_property(baseDir GLOBAL PROPERTY PACKAGE_BASE_DIR)
    get_property(installDir GLOBAL PROPERTY PACKAGE_INSTALL_DIR)
    include(ExternalProject)
    include(${baseDir}/packages/misc.cmake)
    add_subdirectory(${baseDir}/packages/${pkg} EXCLUDE_FROM_ALL)
endfunction()