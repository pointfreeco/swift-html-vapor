import HtmlVaporSupport
import Vapor

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let app = Application(env)
defer { app.shutdown() }

app.get { _ in
  layout(title: "Home", content: home)
}
 
app.get("usage") { _ in
  layout(title: "Usage", content: usage)
}
 
app.get("advanced-usage") { _ in
  layout(title: "Advanced Usage", content: advancedUsage)
}
 
app.get("installation") { _ in
  layout(title: "Installation", content: installation)
}

try app.run()
