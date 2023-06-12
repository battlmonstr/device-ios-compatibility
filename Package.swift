// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DeviceIOSCompatibility",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_14),
    ],
    products: [
        .library(
            name: "DeviceIOSCompatibility",
            targets: ["DeviceIOSCompatibility"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/devicekit/DeviceKit", "5.0.0"..<"100.0.0"),
    ],
    targets: [
        .target(
            name: "DeviceIOSCompatibility",
            dependencies: ["DeviceKit"],
            path: "Sources"
        ),
        .testTarget(
            name: "DeviceIOSCompatibilityTests",
            dependencies: ["DeviceIOSCompatibility"],
            path: "Tests"
        ),
    ]
)
