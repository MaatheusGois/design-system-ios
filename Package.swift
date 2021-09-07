// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignSystemPackage",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "Commons",
            type: .static,
            targets: ["Commons"]
        ),
        .library(
            name: "Colors",
            type: .static,
            targets: ["Colors"]
        ),
        .library(
            name: "Fonts",
            targets: ["Fonts"]
        ),
        .library(
            name: "Icons",
            targets: ["Icons"]
        ),
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]
        )
    ],
    dependencies: [
        .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.9.0")
    ],
    targets: [
        .target(
            name: "Commons",
            dependencies: []
        ),
        .target(
            name: "Colors",
            dependencies: ["Commons"],
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "Fonts",
            dependencies: ["Commons"],
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "Icons",
            dependencies: ["Commons"],
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "Margin",
            dependencies: ["Commons"],
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "DesignSystem",
            dependencies: [
                "Commons",
                "Icons",
                "Colors",
                "Fonts",
                "Margin"
            ]
        ),
        .testTarget(
            name: "IconsTests",
            dependencies: ["Icons", "SnapshotTesting"]
        )
    ]
)
