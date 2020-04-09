// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CocoaSinks",
    platforms: [.iOS(SupportedPlatform.IOSVersion.v13)],
    products: [
        .library(
            name: "CocoaSinks",
            targets: ["CocoaSinks"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CocoaSinks",
            dependencies: []),
        .testTarget(
            name: "CocoaSinksTests",
            dependencies: ["CocoaSinks"])
    ]
)
