ExternalProject_Add (
    zlib-${version}-external
    URL https://zlib.net/zlib-${version}.tar.gz
    ${ExternalProjectArgs} 
)
add_package(zlib zlib-${version}-external STATICS z)