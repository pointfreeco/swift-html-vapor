import Vapor
import URLRouting

public enum RootRouterKey: StorageKey {
    public typealias Value = AnyParserPrinter<URLRequestData, RootRoute>
}

extension Application {
    public var rootRouter: RootRouterKey.Value {
        get {
            self.storage[RootRouterKey.self]!
        }
        set {
            self.storage[RootRouterKey.self] = newValue
        }
    }
}

