// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AnthropicSwiftSDK-Bedrock",
    platforms: [
        .iOS(.v17),
        .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AnthropicSwiftSDK-Bedrock",
            targets: ["AnthropicSwiftSDK-Bedrock"]),
    ],
    dependencies: [
        .package(url: "https://github.com/fumito-ito/AnthropicSwiftSDK", branch: "feature/remove-bedrock-extension"),
        .package(url: "https://github.com/awslabs/aws-sdk-swift", from: "1.0.77")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AnthropicSwiftSDK-Bedrock",
            dependencies: [
                .product(name: "AnthropicSwiftSDK", package: "AnthropicSwiftSDK"),
                .product(name: "AWSBedrockRuntime", package: "aws-sdk-swift")
            ]
        ),
        .testTarget(
            name: "AnthropicSwiftSDK-BedrockTests",
            dependencies: ["AnthropicSwiftSDK-Bedrock"]
        ),
    ]
)
