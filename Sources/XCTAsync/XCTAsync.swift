import XCTest

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
@inline(__always)
func expand<T>(_ expression: () async throws -> T) async -> () throws -> T {
    do {
        let value = try await expression()
        return { value }
    } catch {
        return { throw error }
    }
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssert(
    _ expression: @autoclosure () async throws -> Bool,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    let expression = await expand(expression)
    try? { XCTAssert(try expression(), message(), file: file, line: line) }()
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssertEqual<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async where T : Equatable {
    let expression1 = await expand(expression1)
    let expression2 = await expand(expression2)
    try? { XCTAssertEqual(try expression1(), try expression2(), message(), file: file, line: line) }()
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssertEqual<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    accuracy: T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async where T : FloatingPoint {
    let expression1 = await expand(expression1)
    let expression2 = await expand(expression2)
    try? { XCTAssertEqual(try expression1(), try expression2(), accuracy: accuracy, message(), file: file, line: line) }()
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssertEqual<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    accuracy: T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async where T : Numeric {
    let expression1 = await expand(expression1)
    let expression2 = await expand(expression2)
    try? { XCTAssertEqual(try expression1(), try expression2(), accuracy: accuracy, message(), file: file, line: line) }()
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssertFalse(
    _ expression: @autoclosure () async throws -> Bool,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    let expression = await expand(expression)
    try? { XCTAssertFalse(try expression(), message(), file: file, line: line) }()
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssertGreaterThan<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async where T : Comparable {
    let expression1 = await expand(expression1)
    let expression2 = await expand(expression2)
    try? { XCTAssertGreaterThan(try expression1(), try expression2(), message(), file: file, line: line) }()
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssertGreaterThanOrEqual<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async where T : Comparable {
    let expression1 = await expand(expression1)
    let expression2 = await expand(expression2)
    try? { XCTAssertGreaterThanOrEqual(try expression1(), try expression2(), message(), file: file, line: line) }()
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssertIdentical(
    _ expression1: @autoclosure () async throws -> AnyObject?,
    _ expression2: @autoclosure () async throws -> AnyObject?,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    let expression1 = await expand(expression1)
    let expression2 = await expand(expression2)
    try? { XCTAssertIdentical(try expression1(), try expression2(), message(), file: file, line: line) }()
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssertLessThan<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async where T : Comparable {
    let expression1 = await expand(expression1)
    let expression2 = await expand(expression2)
    try? { XCTAssertLessThan(try expression1(), try expression2(), message(), file: file, line: line) }()
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssertLessThanOrEqual<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async where T : Comparable {
    let expression1 = await expand(expression1)
    let expression2 = await expand(expression2)
    try? { XCTAssertLessThanOrEqual(try expression1(), try expression2(), message(), file: file, line: line) }()
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssertNil(
    _ expression: @autoclosure () async throws -> Any?,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    let expression = await expand(expression)
    try? { XCTAssertNil(try expression(), message(), file: file, line: line) }()
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssertNoThrow<T>(
    _ expression: @autoclosure () async throws -> T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    let expression = await expand(expression)
    try? { XCTAssertNoThrow(try expression(), message(), file: file, line: line) }()
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssertNotEqual<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async where T : Equatable {
    let expression1 = await expand(expression1)
    let expression2 = await expand(expression2)
    try? { XCTAssertNotEqual(try expression1(), try expression2(), message(), file: file, line: line) }()
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssertNotEqual<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    accuracy: T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async where T : FloatingPoint {
    let expression1 = await expand(expression1)
    let expression2 = await expand(expression2)
    try? { XCTAssertNotEqual(try expression1(), try expression2(), accuracy: accuracy, message(), file: file, line: line) }()
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssertNotEqual<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    accuracy: T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async where T : Numeric {
    let expression1 = await expand(expression1)
    let expression2 = await expand(expression2)
    try? { XCTAssertNotEqual(try expression1(), try expression2(), accuracy: accuracy, message(), file: file, line: line) }()
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssertNotIdentical(
    _ expression1: @autoclosure () async throws -> AnyObject?,
    _ expression2: @autoclosure () async throws -> AnyObject?,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    let expression1 = await expand(expression1)
    let expression2 = await expand(expression2)
    try? { XCTAssertNotIdentical(try expression1(), try expression2(), message(), file: file, line: line) }()
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssertNotNil(
    _ expression: @autoclosure () async throws -> Any?,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    let expression = await expand(expression)
    try? { XCTAssertNotNil(try expression(), message(), file: file, line: line) }()
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssertThrowsError<T>(
    _ expression: @autoclosure () async throws -> T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line,
    _ errorHandler: (_ error: Error) -> Void = { _ in }
) async {
    let expression = await expand(expression)
    try? { XCTAssertThrowsError(try expression(), message(), file: file, line: line, errorHandler) }()
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@inlinable
public func XCTAssertTrue(
    _ expression: @autoclosure () async throws -> Bool,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    let expression = await expand(expression)
    try? { XCTAssertTrue(try expression(), message(), file: file, line: line) }()
}

