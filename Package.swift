// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealYandexAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealYandexAdapter",
            targets: ["AppodealYandexAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/yandexmobile/yandex-ads-sdk-ios", exact: "8.3.0"),
    ],
    targets: [
        .target(
            name: "AppodealYandexAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "YandexMobileAds", package: "yandex-ads-sdk-ios"),
                .target(name: "AppodealYandexAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealYandexAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealYandexAdapter/8.3.0.1/AppodealYandexAdapter.xcframework.zip",
            checksum: "0c61e3284d3d5a605a513e4b9af354adb06fe416a97159703cf13a2969f7771f"
        ),

    ]
)
