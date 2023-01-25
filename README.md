# Xcode Strict Concurrency Checking Demo

This project demonstrates an issue in [buildbuddy-io/rules_xcodeproj](https://github.com/buildbuddy-io/rules_xcodeproj) whereby the Swift 5.7 `Strict Concurrency Checking` feature does not seem to work as expected in BwB (Build-with-Bazel) mode. As described below, a buildbuddy-io/rules_xcodeproj Xcode BwB project is compared to a rules_xcodeproj Xcode BwX project, and also a yonaskolb/XcodeGen Xcode project to understand how a vanilla Xcode project behaves.

This project was created to add context and reproduction steps to the [GitHub Issue opened here](https://github.com/buildbuddy-io/rules_xcodeproj/issues/1657).

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

<img width="1000" alt="Screenshot 2023-01-25 at 2 40 31 PM" src="https://user-images.githubusercontent.com/40372184/214672269-3aa19d25-17aa-4dd0-b5ff-88588d12e2cf.png">

### Expected Outcome

`SwiftLib` compiles with **two** concurrency warnings in BwB mode.

<img width="1000" alt="Screenshot 2023-01-25 at 2 39 16 PM" src="https://user-images.githubusercontent.com/40372184/214672342-01f17aed-43de-4227-bfcf-7b8a9461ce6e.png">

### Actual Outcome

`SwiftLib` compiles with **no** concurrency warnings in BwB mode.

<img width="1000" alt="Screenshot 2023-01-25 at 2 39 58 PM" src="https://user-images.githubusercontent.com/40372184/214672409-6d977837-272f-441d-80e4-743d2eba2085.png">

#### 1/25/23 Update

This appears to be working as expected after introducing the `-warn-concurrency` copt to `SwiftLib`.

TODO: Image

## Notes

- [As confirmed here](https://github.com/buildbuddy-io/rules_xcodeproj/issues/1657#issuecomment-1404178027), concurrency warnings are surfaced during command-line build invocation after adding the `-warn-concurrency` copt to `SwiftLib`.
- [As confirmed here](https://github.com/buildbuddy-io/rules_xcodeproj/issues/1657#issuecomment-1404191779), the new `-warn-concurrency` copt successfully propagates to a BwB project and surfaces warnings, provided that there isn't already a cached build that short-circuits first (e.g. the target was previously build successfully via command-line without any additional source edits).
