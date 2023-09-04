import Html

// Functions that take nodes as input and return a new node can serve the purpose that "layouts" do in
// most templating languages. You can have this function take additional arguments in order to customize
// the layout, such as title and meta tags.
func layout(title: String, content: Node, route: RootRoute) -> Node {
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
        header(route: route),
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
//fileprivate func extractedFunc() -> Node {
//
//    RootRoute.allCases.map {  in
//        here i want to get li then pass it
//
//        Attribute<Tag.Li>
//    }
//
//    let advancedUsage: Node = [
//        .ul(
//            attributes: [],
//            .li(.a(attributes: [.href("")], ""))
//        )
//    ]
//
//    Node.ul(attributes: [], pass here )
//
//    return .ul(
//        attributes: [],
//        .li(.a(attributes: [.href("/usage")], "Usage"))
//    )
//}

func header(route: RootRoute) -> Node {
    let dynamicLiList = RootRoute.allCases.map { route -> ChildOf<Tag.Ul> in
        return .li(
            .a(attributes: [Attribute<Tag.A>.href("/\(route.link)")], "\(route.rawValue.capitalized )")
        )
    }

    return [
        .header(
            .h1("swift-html-vapor"),
            .blockquote(
                "A Vapor plugin for type-safe, transformable HTML views using ",
                .a(attributes: [Attribute<Tag.A>.href("https://github.com/pointfreeco/swift-html")], "swift-html")
            ),
            .ul(attributes: [], .fragment(dynamicLiList))
        )
    ]
}



//func header(route: RootRoute) -> Node {
//    print(route)
//
//    return [
//        .header(
//            .h1("swift-html-vapor"),
//            .blockquote(
//                "A Vapor plugin for type-safe, transformable HTML views using ",
//                .a(attributes: [.href("https://github.com/pointfreeco/swift-html")], "swift-html")
//            ),
//            .ul(attributes: [],
//                .li(.a(attributes: [.href("/usage")], "Usage")),
//                .li(.a(attributes: [.href("/advanced-usage")], "Advanced Usage")),
//                .li(.a(attributes: [.href("/installation")], "Installation"))
//            )
//        )
//    ]
//}

// A node that represents the footer to use on each page.
let footer: Node = [
  .hr,
  .footer("© 2019 Point-Free, Inc.")
]
