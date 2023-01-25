load(
    "@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:defs.bzl",
    "top_level_target",
    "xcodeproj",
)

xcodeproj(
    name = "BazelProject_bwx",
    project_name = "BazelProject_bwx",
    build_mode = "xcode",
    tags = ["manual"],
    top_level_targets = [
        top_level_target("//src:SwiftLib_Tests", target_environments = ["simulator"]),
    ],
)

xcodeproj(
    name = "BazelProject_bwb",
    project_name = "BazelProject_bwb",
    build_mode = "bazel",
    tags = ["manual"],
    top_level_targets = [
        top_level_target("//src:SwiftLib_Tests", target_environments = ["simulator"]),
    ],
)
