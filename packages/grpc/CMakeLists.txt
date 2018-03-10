ExternalProject_Add (
    grpc-${version}-external
    DEPENDS openssl protobuf cares zlib
    URL https://github.com/grpc/grpc/archive/v${version}.zip
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${Make} static prefix=<INSTALL_DIR> PROTOC=<INSTALL_DIR>/bin/protoc
    INSTALL_COMMAND ${Make} install-headers_cxx install-static install-plugins prefix=<INSTALL_DIR>
    ${ExternalProjectArgs} 
)
add_package(grpc grpc-${version}-external
    STATICS gpr grpc grpc_cronet grpc_unsecure
    grpc++ grpc++_cronet grpc++_error_details grpc++_reflection grpc++_unsecure
)