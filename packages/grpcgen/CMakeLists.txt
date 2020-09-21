cmake_parse_arguments(
    "USING_PACKAGE_GRPCGEN"
    "" "PROTO_PATH" "PROTO_FILES"
    ${USING_PACKAGE_EXTRA_ARGS}
)

list(TRANSFORM USING_PACKAGE_GRPCGEN_PROTO_FILES PREPEND "${PROJECT_SOURCE_DIR}/")

ExternalProject_Add (
    grpcgen-external
    DEPENDS grpc
    URL ${CMAKE_CURRENT_LIST_DIR}/generator
    CMAKE_CACHE_ARGS
        "-DGRPCGEN_PROTO_PATH:PATH=${USING_PACKAGE_GRPCGEN_PROTO_PATH}"
        "-DGRPCGEN_PROTO_FILES:STRING=${USING_PACKAGE_GRPCGEN_PROTO_FILES}"
    ${ExternalProjectArgs}
)

add_package(grpcgen grpcgen-external
    STATICS grpcgen
)
target_include_directories(grpcgen
    ${PROTOBUF_OUTPUT_DIR} SYSTEM PUBLIC
)