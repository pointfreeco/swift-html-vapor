// swift-tools-version:4.2
import PackageDescription

let package = Package(
  name: "HtmlVaporSupport",
  products: [
    .library(
      name: "HtmlVaporSupport",
      targets: ["HtmlVaporSupport"]),
    .executable(
      name: "HtmlVaporSupportExample",
      targets: ["HtmlVaporSupportExample"]),
    ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-html.git", from: "0.3.1"),
    .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
    ],
  targets: [
    .target(
      name: "HtmlVaporSupport",
      dependencies: ["Html", "Vapor"]),
    .testTarget(
      name: "HtmlVaporSupportTests",
      dependencies: ["HtmlVaporSupport"]),
    .target(
      name: "HtmlVaporSupportExample",
      dependencies: ["HtmlVaporSupport"]),
    ],
  swiftLanguageVersions: [
    .version("5"),
    .v4_2,
    ]
)
