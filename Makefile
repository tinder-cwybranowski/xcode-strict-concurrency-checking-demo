.PHONY: bazel_bwb_project
bazel_bwb_project:
	bazelisk run //:BazelProject_bwb && open BazelProject_bwb.xcodeproj

.PHONY: bazel_bwx_project
bazel_bwx_project:
	bazelisk run //:BazelProject_bwx && open BazelProject_bwx.xcodeproj

.PHONY: xcodegen_project
xcodegen_project:
	bazelisk run @com_github_yonaskolb_xcodegen//:bin/xcodegen -- --spec src/xcodegen.yml && open src/XcodegenProject.xcodeproj
