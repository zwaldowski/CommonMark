// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommonMark",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "CommonMark",
            targets: ["CommonMark"]
        ),
        .library(
            name: "CommonMarkBuilder",
            targets: ["CommonMarkBuilder"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/zwaldowski/cmark-gfm", .branch("swiftpm")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "CommonMark",
            dependencies: ["cmark-gfm"]
        ),
        .target(
            name: "CommonMarkBuilder",
            dependencies: ["CommonMark"]
        ),
        .testTarget(
            name: "CommonMarkTests",
            dependencies: ["CommonMark"]
        ),
        .testTarget(
            name: "CommonMarkSpecTests",
            dependencies: ["CommonMark"]
        ),
        .testTarget(
            name: "CommonMarkBuilderTests",
            dependencies: ["CommonMarkBuilder", "CommonMark"]
        ),
    ]
)
