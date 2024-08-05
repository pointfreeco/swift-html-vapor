import Vapor
import HtmlVaporSupport
import VaporRouting

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let app = Application(env)
defer { app.shutdown() }

let baseURL = "http://\(app.http.server.configuration.hostname):\(app.http.server.configuration.port)"

app.rootRouter = RootRouter()
    .baseURL(baseURL)
    .eraseToAnyParserPrinter()

app.mount(app.rootRouter, use: rootHandler)

app.get { req in
    req.redirect(to: "home")
}

try app.run()

