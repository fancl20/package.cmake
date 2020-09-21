cmake_parse_arguments(
    "USING_PACKAGE_GRPC"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
ExternalProject_Add (
    grpc-external
    # grpc may depending on other absl targets. But absl::base is enough for
    # verifying denpendency.
    DEPENDS absl::base cares protobuf re2 openssl zlib
    URL https://github.com/grpc/grpc/archive/v${USING_PACKAGE_GRPC_VERSION}.zip
    CMAKE_CACHE_ARGS
        "-DgRPC_BUILD_TESTS:BOOL=OFF"
        "-DgRPC_BUILD_CSHARP_EXT:BOOL=OFF"
        "-DgRPC_ABSL_PROVIDER:STRING=module"
        "-DgRPC_CARES_PROVIDER:STRING=package"
        "-DgRPC_PROTOBUF_PROVIDER:STRING=package"
        "-DgRPC_RE2_PROVIDER:STRING=package"
        "-DgRPC_SSL_PROVIDER:STRING=package"
        "-DgRPC_ZLIB_PROVIDER:STRING=package"
        "-DABSL_ROOT_DIR:PATH=${absl_SOURCE_DIR}"
    ${ExternalProjectArgs} 
)
add_package(grpc grpc-external
    STATICS gpr grpc grpc_plugin_support grpc_unsecure grpcpp_channelz
    grpc++ grpc++_alts grpc++_error_details grpc++_reflection grpc++_unsecure
)