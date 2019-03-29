import HtmlVaporSupport
import Vapor

let app = try Application()
let router = try app.make(Router.self)

router.get("/") { _ in
  layout(title: "Home", content: home)
}

router.get("/usage") { _ in
  layout(title: "Usage", content: usage)
}

router.get("/advanced-usage") { _ in
  layout(title: "Advanced Usage", content: advancedUsage)
}

router.get("/installation") { _ in
  layout(title: "Installation", content: installation)
}

try app.run()
