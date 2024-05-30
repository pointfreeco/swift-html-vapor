import Vapor

public func rootHandler(
    request: Request,
    route: RootRoute
) async throws -> AsyncResponseEncodable {
    switch route {
        case .home:
            return layout(title: "Home", content: home, route: route)
        case .usage:
            return layout(title: "Usage", content: usage, route: route)
        case .advanced_usage:
            return layout(title: "Advanced Usage", content: advancedUsage, route: route)
        case .installation:
            return layout(title: "Installation", content: installation, route: route)
    }
}
