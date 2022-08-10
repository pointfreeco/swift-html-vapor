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

#if compiler(>=5.5) && canImport(_Concurrency)
extension Html.Node: AsyncResponseEncodable {
	public func encodeResponse(for request: Request) async throws -> Response {
		try await encodeResponse(for: request).get()
	}
}
#endif
