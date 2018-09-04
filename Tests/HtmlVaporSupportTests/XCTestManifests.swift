import XCTest

extension HtmlVaporSupportTests {
    static let __allTests = [
        ("testSomething", testSomething),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(HtmlVaporSupportTests.__allTests),
    ]
}
#endif
