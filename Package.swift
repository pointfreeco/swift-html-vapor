// swift-tools-version:5.2
import PackageDescription

let package = Package(
  name: "HtmlVaporSupport",
  platforms: [
    .macOS(.v10_15)
  ],
  products: [
    .library(
      name: "HtmlVaporSupport",
      targets: ["HtmlVaporSupport"]),
    .executable(
      name: "HtmlVaporSupportExample",
      targets: ["HtmlVaporSupportExample"]),
    ],
  dependencies: [
    .package(name: "Html", url: "https://github.com/pointfreeco/swift-html.git", from: "0.3.1"),
    .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
    ],
  targets: [
    .target(
      name: "HtmlVaporSupport",
      dependencies: [
        .product(name: "Html", package: "Html"),
        .product(name: "Vapor", package: "vapor"),
      ]),
    .testTarget(
      name: "HtmlVaporSupportTests",
      dependencies: ["HtmlVaporSupport"]),
    .target(
      name: "HtmlVaporSupportExample",
      dependencies: ["HtmlVaporSupport"]),
    ],
  swiftLanguageVersions: [
    .version("5"),
    ]
)
