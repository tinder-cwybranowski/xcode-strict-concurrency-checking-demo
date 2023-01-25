# Xcode Strict Concurrency Checking Demo

This project demonstrates an issue in [buildbuddy-io/rules_xcodeproj](https://github.com/buildbuddy-io/rules_xcodeproj) whereby the Swift 5.7 `Strict Concurrency Checking` feature does not seem to work as expected in BwB (Build-with-Bazel) mode. As described below, a buildbuddy-io/rules_xcodeproj Xcode BwB project is compared to a rules_xcodeproj Xcode BwX project, and also a yonaskolb/XcodeGen Xcode project to understand how a vanilla Xcode project behaves.

This project was created to add context and reproduction steps to the [GitHub Issue opened here](TODO).

## Configuration

These results were validated using the following configuration:

- Host machine:
    - 16-inch MacBook Pro (2021)
    - Apple M1 Max
    - 32 GB memory
    - macOS 12.6 (Monterey)
- Dependecies:
    - Xcode: 14.0.1
    - Bazel: 6.0.0
    - buildbuddy-io/rules_xcodeproj: 0.12.0

## Setup

The `Makefile` contains three commands to demonstrate the issue:

### Bazel BwB Project

The following command produces a [buildbuddy-io/rules_xcodeproj](https://github.com/buildbuddy-io/rules_xcodeproj) Xcode BwB project:
```
make bazel_bwb_project
```

### Bazel BwX Project

The following command produces a [buildbuddy-io/rules_xcodeproj](https://github.com/buildbuddy-io/rules_xcodeproj) Xcode BwX project:
```
make bazel_bwx_project
```

### XcodeGen Project

The following command produces a [yonaskolb/XcodeGen](https://github.com/yonaskolb/XcodeGen) Xcode project:
```
make xcodegen_project
```

## Issue

After performing the following steps:
- `make bazel_bwb_project`
- Configure `Strict Concurrency Checking: complete` via `Project > BazelProject_bwb > Build Settings > Strict Concurrency Checking > complete`
- Build `SwiftLib` target

We see that `SwiftLib` compiles without any additional warnings, which is unexpected.

### Expected Outcome

`SwiftLib` compiles with **two** concurrency warnings in BwB mode.

TODO: Image

### Actual Outcome

`SwiftLib` compiles with **no** concurrency warnings in BwB mode.

TODO: Image
