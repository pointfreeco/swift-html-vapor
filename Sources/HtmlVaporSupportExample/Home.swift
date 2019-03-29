import Html

let home: Node = [
  .p("""
The most popular choice for rendering HTML in a Vapor web app is to use the Leaf templating language,
but it exposes your application to runtime errors and invalid HTML. Our plugin prevents these
runtime issues at compile-time by embedding HTML directly into Swift’s powerful type system. It uses the
swift-html DSL for constructing HTML documents using plain Swift data structures.
"""
  )
]
