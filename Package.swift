// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "swift-html-vapor",
  platforms: [
    .macOS(.v10_15)
  ],
  products: [
    .library(
      name: "HtmlVaporSupport",
      targets: ["HtmlVaporSupport"]
    ),
    .executable(
      name: "HtmlVaporSupportExample",
      targets: ["HtmlVaporSupportExample"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-html", from: "0.4.0"),
    .package(url: "https://github.com/vapor/vapor", from: "4.0.0"),
  ],
  targets: [
    .target(
      name: "HtmlVaporSupport",
      dependencies: [
        .product(name: "Html", package: "swift-html"),
        .product(name: "Vapor", package: "vapor"),
      ]
    ),
    .testTarget(
      name: "HtmlVaporSupportTests",
      dependencies: ["HtmlVaporSupport"]
    ),
    .target(
      name: "HtmlVaporSupportExample",
      dependencies: ["HtmlVaporSupport"]
    ),
  ]
)
