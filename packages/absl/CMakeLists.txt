cmake_parse_arguments(
    "USING_PACKAGE_ABSL"
    "" "VERSION" ""
    ${USING_PACKAGE_EXTRA_ARGS}
)
FetchContent_Declare(
    absl
    URL https://github.com/abseil/abseil-cpp/archive/refs/tags/${USING_PACKAGE_ABSL_VERSION}.zip
)
FetchContent_MakeAvailable(absl)