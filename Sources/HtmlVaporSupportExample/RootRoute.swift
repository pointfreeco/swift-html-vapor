import Parsing
import URLRouting

// MARK:- APIRouter

public enum RootRoute: String, Equatable, CaseIterable {
    case home
    case usage
    case advanced_usage = "Advanced Usage"
    case installation

    var link: String {
        switch self {
            case .home:
                return "home"
            case .usage:
                return "usage"
            case .advanced_usage:
                return "advanced_usage"
            case .installation:
                return "installation"
        }
    }
}

public struct RootRouter: ParserPrinter {

    public init() {}

    public var body: some Router<RootRoute> {
        OneOf {
            Route(.case(RootRoute.home)) {
                Path { "home" }
            }
            Route(.case(RootRoute.usage)) {
                Path { "usage" }
            }
            Route(.case(RootRoute.advanced_usage)) {
                Path { "advanced_usage" }
            }
            Route(.case(RootRoute.installation)) {
                Path { "installation" }
            }
        }
    }
}
