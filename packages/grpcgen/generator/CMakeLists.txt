cmake_minimum_required(VERSION 3.18)

project(grpcgen)

option(GRPCGEN_PROTO_PATH "Path for protobuf files")
option(GRPCGEN_PROTO_FILES "List for protobuf files")

if((NOT GRPCGEN_PROTO_PATH) OR (NOT GRPCGEN_PROTO_FILES))
    message(FATAL_ERROR "Must provide GRPCGEN_PROTO_PATH and GRPCGEN_PROTO_FILES")
endif()

find_package(Protobuf REQUIRED)
find_program(GRPC_CPP_PLUGIN grpc_cpp_plugin)
set(PROTOC_OUTPUT_DIR ${CMAKE_INSTALL_PREFIX}/genproto)
file(MAKE_DIRECTORY ${PROTOC_OUTPUT_DIR})

execute_process(
    COMMAND ${PROTOBUF_PROTOC_EXECUTABLE}
        --proto_path=${GRPCGEN_PROTO_PATH}
        --cpp_out=${PROTOC_OUTPUT_DIR}
        --plugin=protoc-gen-grpc=${GRPC_CPP_PLUGIN}
        --grpc_out=${PROTOC_OUTPUT_DIR}
        ${GRPCGEN_PROTO_FILES}
    RESULT_VARIABLE PRTOC_RESULT
)
if(NOT PRTOC_RESULT EQUAL "0")
    message(FATAL_ERROR "protoc returned non-zero exit code")
endif()

file(GLOB_RECURSE GRPCGEN_PROTOBUF_CC ${PROTOC_OUTPUT_DIR}/*.cc)
add_library(grpcgen STATIC ${GRPCGEN_PROTOBUF_CC})
target_include_directories(grpcgen PRIVATE ${PROTOC_OUTPUT_DIR} ${PROTOBUF_INCLUDE_DIR})
install(TARGETS grpcgen
    ARCHIVE DESTINATION "lib"
    COMPONENT "interface"
)
install(DIRECTORY ${PROTOC_OUTPUT_DIR}/
    DESTINATION "include"
    FILES_MATCHING PATTERN "*.h"
)