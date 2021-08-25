# swift-html-vapor

[![CI](https://github.com/pointfreeco/swift-html-vapor/actions/workflows/ci.yml/badge.svg)](https://github.com/pointfreeco/swift-html-vapor/actions/workflows/ci.yml)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fpointfreeco%2Fswift-html-vapor%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/pointfreeco/swift-html-vapor)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fpointfreeco%2Fswift-html-vapor%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/pointfreeco/swift-html-vapor)

[Vapor](https://vapor.codes) plugin for type-safe, transformable HTML views using [swift-html](https://github.com/pointfreeco/swift-html).

## Motivation

The most popular choice for rendering HTML in a Vapor web app is to use the Leaf templating language, but it exposes your application to **runtime errors** and **invalid HTML**. Our plugin prevents these runtime issues at compile-time by embedding HTML directly into Swift’s powerful type system. It uses the [swift-html](https://github.com/pointfreeco/swift-html) DSL for constructing HTML documents using plain Swift data structures.

## Usage

To use the plugin all you have to do is return a `Node` value from your router callback:

``` swift
import HtmlVaporSupport
import Vapor

var env = try Environment.detect()
let app = Application(env)
defer { app.shutdown() }

app.get { _ in
  Node.h1("Hello, type-safe HTML on Vapor!")
}

try app.run()
```

## Take it for a spin

We've included a sample Vapor application in this repo to show off its usage. To run the app immediately, simply do:

* `swift run HtmlVaporSupportExample`
* Open your browser to `http://localhost:8080`

The HTML for that page is constructed and rendered with swift-html!

If you want to run the app in Xcode so that you can play around with the HTML, try this:

* `git clone https://github.com/pointfreeco/swift-html-vapor`
* `cd swift-html-vapor`
* `make xcodeproj`
* Select the `HtmlVaporSupportExample` target
* Build and run `cmd+R`
* Open your browser to `http://localhost:8080`

## Installation

If you want to use swift-html-vapor in a project that uses [SwiftPM](https://swift.org/package-manager/), it's as simple as adding a `dependencies` clause to your `Package.swift`:

``` swift
dependencies: [
  .package(url: "https://github.com/pointfreeco/swift-html-vapor", from: "0.4.0")
]
```

## License

All modules are released under the MIT license. See [LICENSE](LICENSE) for details.
