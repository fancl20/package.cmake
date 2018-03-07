# ONLY SUPPORT IMPORT STATIC LIBRARY
function(add_package target depends)
    set(options)
    set(oneValueArgs IMPORTED_LOCATION)
    set(multiValueArgs)
    cmake_parse_arguments("ADD_PACKAGE"
        "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN}
    )
    ExternalProject_Get_Property(${depends} install_dir)
    if (ADD_PACKAGE_IMPORTED_LOCATION)
        add_library(${target} STATIC IMPORTED GLOBAL)
        set_target_properties(${target} PROPERTIES
            IMPORTED_LOCATION ${install_dir}/lib/${ADD_PACKAGE_IMPORTED_LOCATION}
        )
    else()
        add_library(${target} INTERFACE IMPORTED GLOBAL)
    endif()
    file(MAKE_DIRECTORY ${install_dir}/include)
    target_include_directories(${target} SYSTEM INTERFACE ${install_dir}/include)
    add_dependencies(${target} ${depends})
endfunction()
