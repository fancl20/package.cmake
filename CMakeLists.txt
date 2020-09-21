cmake_minimum_required(VERSION 3.18)

set_property(GLOBAL PROPERTY PACKAGE_BASE_DIR ${CMAKE_CURRENT_LIST_DIR})
set_property(GLOBAL PROPERTY PACKAGE_INSTALL_DIR ${CMAKE_BINARY_DIR}/_packages/install)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_LIST_DIR} PARENT_SCOPE)

function(using pkg)
    set(USING_PACKAGE_EXTRA_ARGS ${ARGN})
    get_property(baseDir GLOBAL PROPERTY PACKAGE_BASE_DIR)
    get_property(installDir GLOBAL PROPERTY PACKAGE_INSTALL_DIR)
    include(ExternalProject)
    include(FetchContent)
    include(${baseDir}/packages/misc.cmake)
    add_subdirectory(${baseDir}/packages/${pkg} EXCLUDE_FROM_ALL)
endfunction()