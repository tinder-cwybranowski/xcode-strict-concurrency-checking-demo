load(
    "@build_bazel_rules_swift//swift:swift.bzl",
    "swift_library",
    "swift_test",
)

swift_library(
    name = "SwiftLib",
    module_name = "SwiftLib",
    srcs = glob(["swift-lib/source/*.swift"]),
)

swift_test(
    name = "SwiftLib_Tests",
    srcs = glob(["swift-lib/test/*.swift"]),
    deps = [
        ":SwiftLib",
    ],
    visibility = ["//visibility:public"],
)
