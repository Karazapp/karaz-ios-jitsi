// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JitsiMeetSDK",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "JitsiMeetSDK",
            targets: ["JitsiMeetSDKWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/umerkaraz/karaz-jitsi-webrtc", from: "1.0.1"),
        .package(url: "https://github.com/Giphy/giphy-ios-sdk", from: "2.2.12")
    ],
    targets: [
        .binaryTarget(
            name: "JitsiMeetSDK",
            path: "Frameworks/JitsiMeetSDK.xcframework"
        ),
        .target(
            name: "JitsiMeetSDKWrapper",
            dependencies: [
                .target(name: "JitsiMeetSDK"),
                .product(name: "WebRTC", package: "karaz-jitsi-webrtc"),
                .product(name: "GiphyUISDK", package: "giphy-ios-sdk")
            ],
            path: "Sources"
        )
    ]
)
