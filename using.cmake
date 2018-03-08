cmake_minimum_required(VERSION 3.11)

set_property(GLOBAL PROPERTY PACKAGE_BASE_DIR ${CMAKE_CURRENT_LIST_DIR})
function(using pkg version)
    include(ExternalProject)
    get_property(baseDir GLOBAL PROPERTY PACKAGE_BASE_DIR)
    add_subdirectory(${baseDir}/packages/${pkg} EXCLUDE_FROM_ALL)
endfunction()