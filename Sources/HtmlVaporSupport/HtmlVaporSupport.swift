@_exported import Html
import Vapor

extension Html.Node: ResponseEncodable {
  public func encode(for req: Request) throws -> EventLoopFuture<Response> {
    return req.future().map {
      Response(http: .init(headers: ["content-type": "text/html; charset=utf-8"], body: Html.render(self)), using: req.sharedContainer)
    }
  }
}
