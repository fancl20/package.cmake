function(add_package target depend)
    cmake_parse_arguments("ADD_PACKAGE" "" "" "STATICS" ${ARGN})
    ExternalProject_Get_Property(${depend} install_dir)
    file(MAKE_DIRECTORY
        ${install_dir}/include
        ${install_dir}/lib
    )

    add_library(${target} INTERFACE IMPORTED GLOBAL)
    target_include_directories(${target}
        SYSTEM INTERFACE ${install_dir}/include
    )
    add_dependencies(${target} ${depend})
    foreach(lib ${ADD_PACKAGE_STATICS})
        set(libTarget ${target}::${lib})
        set(libPath ${install_dir}/lib/lib${lib}.a)
        add_library(${libTarget} STATIC IMPORTED GLOBAL)
        set_target_properties(${libTarget} PROPERTIES
            IMPORTED_LOCATION ${libPath}
        )
        target_include_directories(${libTarget}
            SYSTEM INTERFACE ${install_dir}/include
        )
        set_property(TARGET ${target} APPEND PROPERTY
            INTERFACE_LINK_LIBRARIES ${libPath}
        )
        add_dependencies(${target} ${libTarget})
        add_dependencies(${libTarget} ${depend})
    endforeach()
endfunction()

set(PackageRun ${CMAKE_COMMAND} -E env
    PATH=<INSTALL_DIR>/bin:$ENV{PATH}
    PKG_CONFIG_PATH=<INSTALL_DIR>/lib/pkgconfig:<INSTALL_DIR>/share/pkgconfig
)
set(Make ${PackageRun} $(MAKE))
set(ExternalProjectArgs
    CMAKE_COMMAND ${PackageRun} cmake
    CMAKE_CACHE_ARGS
        "-DCMAKE_PREFIX_PATH:PATH=<INSTALL_DIR>"
        "-DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>"
        "-DCMAKE_INSTALL_LIBDIR:PATH=lib"
        "-DCMAKE_CXX_STANDARD:STRING=${CMAKE_CXX_STANDARD}"
        "-DCMAKE_CXX_STANDARD_REQUIRED:BOOL=${CMAKE_CXX_STANDARD_REQUIRED}"
        "-DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON" # https://github.com/gflags/gflags/issues/283
    BUILD_IN_SOURCE 1
    INSTALL_DIR ${installDir}
)
