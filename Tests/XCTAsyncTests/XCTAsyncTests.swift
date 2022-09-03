import XCTest
@testable import XCTAsync

final class XCTAsyncTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(XCTAsync().text, "Hello, World!")
    }
}
