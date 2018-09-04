@_exported import Html
import Vapor

extension Html.Node: ResponseEncodable {
  public func encode(for req: Request) throws -> EventLoopFuture<Response> {
    let res = Response(http: .init(headers: ["content-type": "text/html; charset=utf-8"], body: Html.render(self)), using: req.sharedContainer)
    return req.sharedContainer.eventLoop.newSucceededFuture(result: res)
  }
}
