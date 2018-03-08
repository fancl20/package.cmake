function(add_package target depend)
    set(options)
    set(oneValueArgs)
    set(multiValueArgs STATICS)
    cmake_parse_arguments("ADD_PACKAGE"
        "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN}
    )
    ExternalProject_Get_Property(${depend} install_dir)
    file(MAKE_DIRECTORY ${install_dir}/include)

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
