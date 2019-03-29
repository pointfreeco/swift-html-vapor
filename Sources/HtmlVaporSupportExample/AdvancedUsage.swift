import Html

let advancedUsage: Node = [
  .h2("Advanced Usage"),
  .p("""
Typically you will not want to reconstruct a full HTML document to be rendered for each of your routes. Instead you can build up lots of smaller HTML fragments and piece them together to make a larger document. For example, a persistent header and footer for your site could be broken out into individual nodes:
"""),
  .pre(#"""
// A node that represents the header to use on each page.
let header: Node = [
  .header(
    .h1("Point-Free"),
    .blockquote("A video series on the Swift programming language and functional programming."),
    .ul(attributes: [], [
      .li(.a(attributes: [.href("/")], "Home")),
      .li(.a(attributes: [.href("/about")], "About")),
      .li(.a(attributes: [.href("/contact-us")], "Contact Us")),
      ]
    )
  )
]

// A node that represents the footer to use on each page.
let footer: Node = [
  .hr,
  .footer("© 2019 Point-Free, Inc.")
]
"""#),
  .p("""
Then, to assemble the parts in a consistent manner we can simply create a function that takes a node as input, which represents the main, central content of your page, and it will return a new node, which is the fully constructed HTML page:
"""),
  .pre(#"""
func layout(content: Node) -> Node {
  return [
    .doctype,
    .html(
      .head(
        // Load any external style sheets you need access to:
        .link(attributes: [
          .rel(.stylesheet),
          .href("https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/cerulean/bootstrap.min.css")
          ])
      ),
      .body(
        header,
        .main(content),
        footer,
        // Load external scripts at the bottom of the document.
        .script(attributes: [.src("https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js")])
      )
    )
  ]
}
"""#),
  .p("""
Now, in your router you can wrap the content that is specific to that page in your layout by just invoking the \(.code("layout(content:)")) function:
"""),
  .pre(#"""
import HtmlVaporSupport
import Vapor

let app = try Application()
let router = try app.make(Router.self)

router.get("/contact-us") { _ in
  layout(content: [
    .h1("Contact us"),
    .p("Feel free to reach out to us with any questions at support@pointfree.co")
  ])
}

try app.run()
"""#
  ),
  .p("""
Now a full HTML page will be rendered, including a \(.code("head")) tag with stylesheets, a header with navigation links, the main content in the middle, and a footer with a copyright notice. The best part is that because everything is just simple Swift data we are free to arrange and compose this data in anyway we want. In particular, we are allowed to keep all of our helper nodes in the same file if we want, or we can break them out into multiple files if that works better for us. Compare that to templates where you are forced to always put views in a new file, no matter how tiny and insignificant it is.
"""),
]
