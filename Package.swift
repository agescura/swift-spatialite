// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "SwiftSpatiaLite",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .tvOS(.v16),
        .watchOS(.v9),
    ],
    products: [
        .library(
            name: "SwiftSpatiaLite",
            targets: ["SwiftSpatiaLite"]
        )
    ],
    traits: [
        .trait(
            name: "CasePaths",
            description: "Introduce support for enum tables."
        ),
        .trait(
            name: "ColumnCoding",
            description: "Align the Codable coding of tables and selections with their column names."
        ),
        .trait(
            name: "LazyInitializableByDefault",
            description: "Optionalize draft properties that have no default."
        ),
        .trait(
            name: "SuppressPlatformSQLiteAvailability",
            description: """
            Suppress '@available' checks on APIs that depend on a newer version of SQLite than the one \
            bundled with the platform.
            """
        ),
        .trait(
            name: "StrictDecoding",
            description: """
            Throw an error, rather than coerce, when decoding a column whose storage type does not \
            match the expected type.
            """
        ),
        .trait(
            name: "Tagged",
            description: "Introduce SQLiteData conformances to the swift-tagged package."
        ),
        .trait(
            name: "SQLiteDataTagged",
            description: "A deprecated alias for the 'Tagged' trait.",
            enabledTraits: ["Tagged"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/sqlite-data",
            exact: "1.12.0"
        ),
        .package(
            url: "https://github.com/pointfreeco/swift-structured-queries",
            exact: "0.39.2",
            traits: [
                .trait(name: "CasePaths", condition: .when(traits: ["CasePaths"])),
                .trait(name: "ColumnCoding", condition: .when(traits: ["ColumnCoding"])),
                .trait(
                    name: "LazyInitializableByDefault",
                    condition: .when(traits: ["LazyInitializableByDefault"])
                ),
                .trait(
                    name: "SuppressPlatformSQLiteAvailability",
                    condition: .when(traits: ["SuppressPlatformSQLiteAvailability"])
                ),
                .trait(name: "Tagged", condition: .when(traits: ["Tagged"])),
            ]
        ),
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
