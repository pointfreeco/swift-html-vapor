@_exported import Html
import Vapor

extension Html.Node: ResponseEncodable {
  public func encodeResponse(for request: Request) -> EventLoopFuture<Response> {
    var headers = HTTPHeaders()
    headers.add(name: .contentType, value: "text/html; charset=utf-8")

    return request.eventLoop.makeSucceededFuture(.init(
      headers: headers,
      body: .init(string: Html.render(self))
    ))
  }
}
