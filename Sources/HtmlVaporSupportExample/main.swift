import HtmlVaporSupport
import Vapor

let app = try Application()
let router = try app.make(Router.self)

let stylesheet: StaticString = """
body {
  padding: 0.5rem;
  line-height: 1.35;
  font-family: SanFranciscoDisplay-Regular;
}

blockquote {
  border-left: 2px #777 solid;
  font-style: italic;
  color: #777;
  margin-left: 1rem;
  padding-left: 0.5rem;
}

pre {
  background-color: #f3f3f3;
  padding: 0.5rem;
  overflow-x: scroll;
}

code {
  background-color: #f3f3f3;
  padding: 0.25rem;
}

li:not(:last-child) {
    margin-bottom: 0.25rem;
}

h2 {
  margin-top: 2rem;
  margin-bottom: 0;
}
"""

router.get("/") { _ in
  html([
    head([style(stylesheet)]),

    body([
      h1(["swift-html-vapor"]),
      blockquote([
        "A Vapor plugin for type-safe, transformable HTML views using ",
        a([href("https://github.com/pointfreeco/swift-html")], ["swift-html"])
        ]),

      h2(["Motivation"]),
      p(["""
The most popular choice for rendering HTML in a Vapor web app is to use the Leaf templating language,
but it exposes your application to runtime errors and invalid HTML. Our plugin prevents these
runtime issues at compile-time by embedding HTML directly into Swift’s powerful type system. It uses the
swift-html DSL for constructing HTML documents using plain Swift data structures.
"""
        ]),

      h2(["Usage"]),
      p(["""
To use the plugin all you have to do is return a `Node` value from your router callback:
"""]),
      pre(["""
import HtmlVaporSupport
import Vapor

let app = try Application()
let router = try app.make(Router.self)

router.get("/") { _ in
  h1(["Hello, type-safe HTML on Vapor!"])
}

try app.run()
"""
        ]),

      h2(["Take it for a spin"]),
      p(["""
We've included a sample Vapor application in this repo to show off its usage. To run the app
immediately, simply do:
"""]),
      ul([
        li([code(["swift run HtmlVaporSupportExample"])]),
        li(["Open your browser to ", code(["http://localhost:8080"])])
        ]),
      p(["""
The HTML for that page is constructed and rendered with swift-html!
"""]),
      p(["""
If you want to run the app in Xcode so that you can play around with the HTML, try this:
"""]),
      ul([
        li([code(["git clone https://github.com/pointfreeco/swift-html-vapor"])]),
        li([code(["cd swift-html-vapor"])]),
        li([code(["make xcodeproj"])]),
        li(["Select the ", code(["HtmlVaporSupportExample"]), " target"]),
        li(["Build and run ", code(["cmd+R"])]),
        li(["Open your browser to ", code(["http://localhost:8080`"])])
        ])
      ])
    ])
}

try app.run()
