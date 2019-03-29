import Html

// Functions that take nodes as input and return a new node can serve the purpose that "layouts" do in
// most templating languages. You can have this function take additional arguments in order to customize
// the layout, such as title and meta tags.
func layout(title: String, content: Node) -> Node {
  return [
    .doctype,
    .html(
      .head(
        .title(title),

        // You can include inline stylesheets
        .style(safe: stylesheet),

        // Or link to external stylesheets
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
        .script(attributes: [
          .async(true),
          .src("https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js")
          ])
      )
    )
  ]
}

// A node that represents the header to use on each page.
let header: Node = [
  .header(
    .h1("swift-html-vapor"),
    .blockquote(
      "A Vapor plugin for type-safe, transformable HTML views using ",
      .a(attributes: [.href("https://github.com/pointfreeco/swift-html")], "swift-html")
    ),
    .ul(attributes: [], [
      .li(.a(attributes: [.href("/")], "Home")),
      .li(.a(attributes: [.href("/usage")], "Usage")),
      .li(.a(attributes: [.href("/advanced-usage")], "Advanced Usage")),
      .li(.a(attributes: [.href("/installation")], "Installation"))
      ]
    )
  )
]

// A node that represents the footer to use on each page.
let footer: Node = [
  .hr,
  .footer("© 2019 Point-Free, Inc.")
]
