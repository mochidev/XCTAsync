import XCTest
import XCTAsync

struct TestError: Error, Equatable {}
class TestClass {
    init() {}
}

func sync<T>(_ value: T) -> T { value }
func syncThrows<T>(_ value: T) throws -> T { value }
func syncThrowsError<T>(_ value: T) throws -> T { throw TestError() }

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
func async<T>(_ value: T) async -> T { value }
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
func asyncThrows<T>(_ value: T) async throws -> T { value }
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
func asyncThrowsError<T>(_ value: T) async throws -> T { throw TestError() }

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
final class XCTAsyncTests: XCTestCase {
    func testAsyncAssert() async throws {
        await XCTAssert(sync(true))
        await XCTAssert(await async(true))
        await XCTAssert(true)
        await XCTAssert(try syncThrows(true))
        await XCTAssert(try await asyncThrows(true))
    }
    
    func testSyncAssert() throws {
        XCTAssert(sync(true))
        XCTAssert(true)
        XCTAssert(try syncThrows(true))
    }
    
    func testAsyncAssertEqual() async {
        await XCTAssertEqual(sync(true), sync(true))
        await XCTAssertEqual(await async(true), await async(true))
        await XCTAssertEqual(true, true)
        await XCTAssertEqual(try syncThrows(true), try syncThrows(true))
        await XCTAssertEqual(try await asyncThrows(true), try await asyncThrows(true))
    }
    
    func testSyncAssertEqual() {
        XCTAssertEqual(sync(true), sync(true))
        XCTAssertEqual(true, true)
        XCTAssertEqual(try syncThrows(true), try syncThrows(true))
    }
    
    func testAsyncAssertEqualAccuracy() async {
        await XCTAssertEqual(sync(3.14), sync(3.14), accuracy: 0.01)
        await XCTAssertEqual(await async(3.14), await async(3.14), accuracy: 0.01)
        await XCTAssertEqual(3.14, 3.14, accuracy: 0.01)
        await XCTAssertEqual(try syncThrows(3.14), try syncThrows(3.14), accuracy: 0.01)
        await XCTAssertEqual(try await asyncThrows(3.14), try await asyncThrows(3.14), accuracy: 0.01)
    }
    
    func testSyncAssertEqualAccuracy() {
        XCTAssertEqual(sync(3.14), sync(3.14), accuracy: 0.01)
        XCTAssertEqual(3.14, 3.14, accuracy: 0.01)
        XCTAssertEqual(try syncThrows(3.14), try syncThrows(3.14), accuracy: 0.01)
    }
    
    func testAsyncAssertFalse() async throws {
        await XCTAssertFalse(sync(false))
        await XCTAssertFalse(await async(false))
        await XCTAssertFalse(false)
        await XCTAssertFalse(try syncThrows(false))
        await XCTAssertFalse(try await asyncThrows(false))
    }
    
    func testSyncAssertFalse() throws {
        XCTAssertFalse(sync(false))
        XCTAssertFalse(false)
        XCTAssertFalse(try syncThrows(false))
    }
    
    func testAsyncAssertGreaterThan() async {
        await XCTAssertGreaterThan(sync(5), sync(2))
        await XCTAssertGreaterThan(await async(5), await async(2))
        await XCTAssertGreaterThan(5, 2)
        await XCTAssertGreaterThan(try syncThrows(5), try syncThrows(2))
        await XCTAssertGreaterThan(try await asyncThrows(5), try await asyncThrows(2))
    }
    
    func testSyncAssertGreaterThan() {
        XCTAssertGreaterThan(sync(5), sync(2))
        XCTAssertGreaterThan(5, 2)
        XCTAssertGreaterThan(try syncThrows(5), try syncThrows(2))
    }
    
    func testAsyncAssertGreaterThanOrEqual() async {
        await XCTAssertGreaterThanOrEqual(sync(5), sync(2))
        await XCTAssertGreaterThanOrEqual(await async(5), await async(2))
        await XCTAssertGreaterThanOrEqual(5, 2)
        await XCTAssertGreaterThanOrEqual(try syncThrows(5), try syncThrows(2))
        await XCTAssertGreaterThanOrEqual(try await asyncThrows(5), try await asyncThrows(2))
    }
    
    func testSyncAssertGreaterThanOrEqual() {
        XCTAssertGreaterThanOrEqual(sync(5), sync(2))
        XCTAssertGreaterThanOrEqual(5, 2)
        XCTAssertGreaterThanOrEqual(try syncThrows(5), try syncThrows(2))
    }
    
    func testAsyncAssertIdentical() async {
        let object = TestClass()
        await XCTAssertIdentical(sync(object), sync(object))
        await XCTAssertIdentical(await async(object), await async(object))
        await XCTAssertIdentical(object, object)
        await XCTAssertIdentical(try syncThrows(object), try syncThrows(object))
        await XCTAssertIdentical(try await asyncThrows(object), try await asyncThrows(object))
    }
    
    func testSyncAssertIdentical() {
        let object = TestClass()
        XCTAssertIdentical(sync(object), sync(object))
        XCTAssertIdentical(object, object)
        XCTAssertIdentical(try syncThrows(object), try syncThrows(object))
    }
    
    func testAsyncAssertLessThan() async {
        await XCTAssertLessThan(sync(5), sync(7))
        await XCTAssertLessThan(await async(5), await async(7))
        await XCTAssertLessThan(5, 7)
        await XCTAssertLessThan(try syncThrows(5), try syncThrows(7))
        await XCTAssertLessThan(try await asyncThrows(5), try await asyncThrows(7))
    }
    
    func testSyncAssertLessThan() {
        XCTAssertLessThan(sync(5), sync(7))
        XCTAssertLessThan(5, 7)
        XCTAssertLessThan(try syncThrows(5), try syncThrows(7))
    }
    
    func testAsyncAssertLessThanOrEqual() async {
        await XCTAssertLessThanOrEqual(sync(5), sync(7))
        await XCTAssertLessThanOrEqual(await async(5), await async(7))
        await XCTAssertLessThanOrEqual(5, 7)
        await XCTAssertLessThanOrEqual(try syncThrows(5), try syncThrows(7))
        await XCTAssertLessThanOrEqual(try await asyncThrows(5), try await asyncThrows(7))
    }
    
    func testSyncAssertLessThanOrEqual() {
        XCTAssertLessThanOrEqual(sync(5), sync(7))
        XCTAssertLessThanOrEqual(5, 7)
        XCTAssertLessThanOrEqual(try syncThrows(5), try syncThrows(7))
    }
    
    func testAsyncAssertNil() async throws {
        let optional: Int? = nil
        await XCTAssertNil(sync(optional))
        await XCTAssertNil(await async(optional))
        await XCTAssertNil(optional)
        await XCTAssertNil(try syncThrows(optional))
        await XCTAssertNil(try await asyncThrows(optional))
    }
    
    func testSyncAssertNil() throws {
        let optional: Int? = nil
        XCTAssertNil(sync(optional))
        XCTAssertNil(optional)
        XCTAssertNil(try syncThrows(optional))
    }
    
    func testAsyncAssertNoThrow() async throws {
        await XCTAssertNoThrow(sync(1))
        await XCTAssertNoThrow(await async(1))
        await XCTAssertNoThrow(1)
        await XCTAssertNoThrow(try syncThrows(1))
        await XCTAssertNoThrow(try await asyncThrows(1))
    }
    
    func testSyncAssertNoThrow() throws {
        XCTAssertNoThrow(sync(1))
        XCTAssertNoThrow(1)
        XCTAssertNoThrow(try syncThrows(1))
    }
    
    func testAsyncAssertNotEqual() async {
        await XCTAssertNotEqual(sync(true), sync(false))
        await XCTAssertNotEqual(await async(true), await async(false))
        await XCTAssertNotEqual(true, false)
        await XCTAssertNotEqual(try syncThrows(true), try syncThrows(false))
        await XCTAssertNotEqual(try await asyncThrows(true), try await asyncThrows(false))
    }
    
    func testSyncAssertNotEqual() {
        XCTAssertNotEqual(sync(true), sync(false))
        XCTAssertNotEqual(true, false)
        XCTAssertNotEqual(try syncThrows(true), try syncThrows(false))
    }
    
    func testAsyncAssertNotEqualAccuracy() async {
        await XCTAssertNotEqual(sync(3.14), sync(6.28), accuracy: 0.01)
        await XCTAssertNotEqual(await async(3.14), await async(6.28), accuracy: 0.01)
        await XCTAssertNotEqual(3.14, 6.28, accuracy: 0.01)
        await XCTAssertNotEqual(try syncThrows(3.14), try syncThrows(6.28), accuracy: 0.01)
        await XCTAssertNotEqual(try await asyncThrows(3.14), try await asyncThrows(6.28), accuracy: 0.01)
    }
    
    func testSyncAssertEqualNotAccuracy() {
        XCTAssertNotEqual(sync(3.14), sync(6.28), accuracy: 0.01)
        XCTAssertNotEqual(3.14, 6.28, accuracy: 0.01)
        XCTAssertNotEqual(try syncThrows(3.14), try syncThrows(6.28), accuracy: 0.01)
    }
    
    func testAsyncAssertNotIdentical() async {
        let objectA = TestClass()
        let objectB = TestClass()
        await XCTAssertNotIdentical(sync(objectA), sync(objectB))
        await XCTAssertNotIdentical(await async(objectA), await async(objectB))
        await XCTAssertNotIdentical(objectA, objectB)
        await XCTAssertNotIdentical(try syncThrows(objectA), try syncThrows(objectB))
        await XCTAssertNotIdentical(try await asyncThrows(objectA), try await asyncThrows(objectB))
    }
    
    func testSyncAssertNotIdentical() {
        let objectA = TestClass()
        let objectB = TestClass()
        XCTAssertNotIdentical(sync(objectA), sync(objectB))
        XCTAssertNotIdentical(objectA, objectB)
        XCTAssertNotIdentical(try syncThrows(objectA), try syncThrows(objectB))
    }
    
    func testAsyncAssertNotNil() async throws {
        let optional: Int? = 1
        await XCTAssertNotNil(sync(optional))
        await XCTAssertNotNil(await async(optional))
        await XCTAssertNotNil(optional)
        await XCTAssertNotNil(try syncThrows(optional))
        await XCTAssertNotNil(try await asyncThrows(optional))
    }
    
    func testSyncAssertNotNil() throws {
        let optional: Int? = 1
        XCTAssertNotNil(sync(optional))
        XCTAssertNotNil(optional)
        XCTAssertNotNil(try syncThrows(optional))
    }
    
    func testAsyncAssertThrowsError() async throws {
        await XCTAssertThrowsError(try syncThrowsError(true))
        await XCTAssertThrowsError(try await asyncThrowsError(true))
    }
    
    func testSyncAssertThrowsError() throws {
        XCTAssertThrowsError(try syncThrowsError(true))
    }
    
    func testAsyncAssertTrue() async throws {
        await XCTAssertTrue(sync(true))
        await XCTAssertTrue(await async(true))
        await XCTAssertTrue(true)
        await XCTAssertTrue(try syncThrows(true))
        await XCTAssertTrue(try await asyncThrows(true))
    }
    
    func testSyncAssertTrue() throws {
        XCTAssertTrue(sync(true))
        XCTAssertTrue(true)
        XCTAssertTrue(try syncThrows(true))
    }
}
