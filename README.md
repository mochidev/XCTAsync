# XCTAsync

<p align="center">
<a href="https://swiftpackageindex.com/mochidev/XCTAsync">
<img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmochidev%2FXCTAsync%2Fbadge%3Ftype%3Dswift-versions" />
</a>
<a href="https://swiftpackageindex.com/mochidev/XCTAsync">
<img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmochidev%2FXCTAsync%2Fbadge%3Ftype%3Dplatforms" />
</a>
<a href="https://github.com/mochidev/XCTAsync/actions?query=workflow%3A%22Test+XCTAsync%22">
<img src="https://github.com/mochidev/XCTAsync/workflows/Test%20XCTAsync/badge.svg" alt="Test Status" />
</a>
</p>

`XCTAsync` redefines many `XCTAssert` functions as async functions within asynchronous contexts.

## Installation

Add `XCTAsync` as a dependency in your `Package.swift` file to start using it. Then, add `import XCTAssert` to any file you wish to use the library in.

Please check the [releases](https://github.com/mochidev/XCTAsync/releases) for recommended versions.

```swift
dependencies: [
    .package(url: "https://github.com/mochidev/XCTAsync.git", .upToNextMajor(from: "1.0.0")),
],
...
targets: [
    .testTarget(
        name: "MyPackageTests",
        dependencies: [
            "XCTAsync",
        ]
    )
]
```

## What is `XCTAsync`?

`XCTAsync` is a collection of functions for testing asynchonous code:

```swift
import XCTest
import XCTAsync

func testAsyncMethods() async {
    await XCTAssertTrue(await asynchronousMethod())
}
```

Note that `XCTAsync` is only necessary for async methods, and will not be overloaded in synchronous contexts:

```swift
import XCTest
import XCTAsync

func testSyncMethods() {
    XCTAssertTrue(synchronousMethod())
}
```

However, if you are in an asynchronous test, you'll need to use the asynchronous variants for each assert:

```swift
import XCTest
import XCTAsync

func testSyncMethods() async {
    await XCTAssertTrue(synchronousMethod())
}
```

## Contributing

Contribution is welcome! Please take a look at the issues already available, or start a new issue to discuss a new feature. Although guarantees can't be made regarding feature requests, PRs that fit with the goals of the project and that have been discussed before hand are more than welcome!

Please make sure that all submissions have clean commit histories, are well documented, and thoroughly tested. **Please rebase your PR** before submission rather than merge in `main`. Linear histories are required.
