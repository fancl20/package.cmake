ExternalProject_Add (
    sol-${version}-external
    URL https://github.com/ThePhD/sol2/archive/v${version}.zip
    ${ExternalProjectArgs} 
)
add_package(sol sol-${version}-external)