# swift-html-vapor

[![Swift 4.1](https://img.shields.io/badge/swift-4.1-ED523F.svg?style=flat)](https://swift.org/download/)
[![Linux CI](https://img.shields.io/travis/pointfreeco/swift-html-vapor/master.svg?label=linux)](https://travis-ci.org/pointfreeco/swift-html-vapor)
[![@pointfreeco](https://img.shields.io/badge/contact-@pointfreeco-5AA9E7.svg?style=flat)](https://twitter.com/pointfreeco)

[Vapor](https://vapor.codes) plugin for type-safe, transformable HTML views using [swift-html](https://github.com/pointfreeco/swift-html).

## Motivation

The most popular choice for rendering HTML in a Vapor web app is to use the Leaf templating language, but it exposes your application to **runtime errors** and **invalid HTML**. Our plugin prevents these runtime issues at compile-time by embedding HTML directly into Swift’s powerful type system. It uses the [swift-html](https://github.com/pointfreeco/swift-html) DSL for constructing HTML documents using plain Swift data structures.

## Usage

To use the plugin all you have to do is return a `Node` value from your router callback:

``` swift
import HtmlVaporSupport
import Vapor

let app = try Application()
let router = try app.make(Router.self)

router.get("/") { _ in
  h1(["Hello, type-safe HTML on Vapor!"])
}

try app.run()
```

## Take it for a spin

We've included a sample Vapor application in this repo to show off its usage. Simply perform the following:

* `git clone https://github.com/pointfreeco/swift-html-vapor`
* `cd swift-html-vapor`
* `make xcodeproj`
* Select the `HtmlVaporSupportExample` target
* Build and run `cmd+R`
* Open your browser to `http://localhost:8080`

The HTML for that page is constructed and rendered with swift-html!

## Installation

If you want to use swift-html-vapor in a project that uses [SwiftPM](https://swift.org/package-manager/), it's as simple as adding a `dependencies` clause to your `Package.swift`:

``` swift
dependencies: [
  .package(url: "https://github.com/pointfreeco/swift-html-vapor.git", from: "0.1.0")
]
```

### Xcode Sub-project

Submodule, clone, or download swift-html-vapor, and drag `HtmlVaporSupport.xcodeproj` into your project.

## License

All modules are released under the MIT license. See [LICENSE](LICENSE) for details.
