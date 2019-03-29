import Html

let installation: Node = [
  .h2("Take it for a spin"),
  .p("""
We've included a sample Vapor application in this repo to show off its usage. To run the app
immediately, simply do:
"""
  ),
  .ul(
    .li(.code("swift run HtmlVaporSupportExample")),
    .li("Open your browser to \(.code("http://localhost:8080"))")
  ),
  .p("""
The HTML for that page is constructed and rendered with swift-html!
"""
  ),
  .p("""
If you want to run the app in Xcode so that you can play around with the HTML, try this:
"""
  ),
  .ul(
    .li(.code("git clone https://github.com/pointfreeco/swift-html-vapor")),
    .li(.code("cd swift-html-vapor")),
    .li(.code("make xcodeproj")),
    .li("Select the \(.code("HtmlVaporSupportExample")) target"),
    .li("Build and run \(.code("cmd+R"))"),
    .li("Open your browser to \(.code("http://localhost:8080"))")
  )
]
