// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "apollo-generation-interface-issue",
    platforms: [
        .macOS(.v10_15)
    ],
//    products: [
//        .library(
//            name: "apollo-generation-interface-issue",
//            targets: ["apollo-generation-interface-issue"]),
//    ],
    dependencies: [
        .package(name: "Apollo", url: "https://github.com/apollographql/apollo-ios.git",
                 .upToNextMinor(from: "0.42.0")),
        // The official Swift argument parser.
        .package(url: "https://github.com/apple/swift-argument-parser.git",
                 .upToNextMinor(from: "0.3.0")),
    ],
    targets: [
        .target(
            name: "apollo-generation-interface-issue",
            dependencies: [
                .product(name: "ApolloCodegenLib", package: "Apollo"),
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        )
    ]
)
