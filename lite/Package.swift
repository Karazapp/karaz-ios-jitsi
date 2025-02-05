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
        .package(url: "https://github.com/jitsi/webrtc", branch: "M124")
    ],
    targets: [
        .binaryTarget(
            name: "JitsiMeetSDK",
            path: "../lite/Frameworks/JitsiMeetSDK.xcframework"
        ),
        .target(
            name: "JitsiMeetSDKWrapper",
            dependencies: [
                .target(name: "JitsiMeetSDK"),
                .product(name: "WebRTC", package: "webrtc")
            ],
            path: "Sources"
        )
    ]
)
