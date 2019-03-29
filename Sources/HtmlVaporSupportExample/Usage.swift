import Html

let usage: Node = [
  .h2("Usage"),
  .p("""
To use the plugin all you have to do is return a `Node` value from your router callback:
"""
  ),
  .pre(#"""
import HtmlVaporSupport
import Vapor

let app = try Application()
let router = try app.make(Router.self)

router.get("/") { _ in
  Node.h1("Hello, type-safe HTML on Vapor!")
}

try app.run()
"""#
  ),
]
