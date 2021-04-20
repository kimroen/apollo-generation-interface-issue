import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(apollo_generation_interface_issueTests.allTests),
    ]
}
#endif
