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

router.get("/add", Int.parameter, Int.parameter) { req in
  try layout(
    title: "Adding",
    content: add(
      req.parameters.next(Int.self),
      req.parameters.next(Int.self)
    )
  )
}

router.get("/sleepy-usage", Int.parameter) { req -> EventLoopFuture<Node> in
  let s = try req.parameters.next(Int.self)
  let promise = req.sharedContainer.eventLoop.newPromise(of: Node.self)
  DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + TimeInterval(s)) {
    promise.succeed(result: layout(title: "Sleep for \(s) then Usage", content: usage))
  }
  return promise.futureResult
}

try app.run()
