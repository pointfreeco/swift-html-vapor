import Html

func add(_ x: Int, _ y: Int) -> Node {
  return [
    .h2("Dynamic Example: Adding Two Path Components"),
    .p("\(String(x)) + \(String(y)) = \(String(x + y))"),
  ]
}
