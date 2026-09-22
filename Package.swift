// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SwiftSpatiaLite",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "SwiftSpatiaLite",
            targets: ["SwiftSpatiaLite"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/sqlite-data",
            from: "1.9.0"
        )
    ],
    targets: [
        .target(
            name: "SwiftSpatiaLite",
            dependencies: [
                "SpatiaGIS",
                .product(
                    name: "SQLiteData",
                    package: "sqlite-data"
                )
            ]
        ),
        .binaryTarget(
            name: "SpatiaGIS",
            path: "Sources/SpatiaGISBinary/SpatiaGIS.xcframework"
        )
    ]
)
