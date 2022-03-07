//
//  AuthorTests.swift
//  Barstools CollectionTests
//
//  Created by David Lee on 3/7/22.
//

import XCTest
@testable import Barstools_Collection

// Making sure that the initialization is what we expect
class AuthorTests: XCTestCase {
    
    func testInit() {
        let author = Author(name: "name", avatar: "avatar")
        XCTAssertEqual(author.name, "name")
        XCTAssertEqual(author.avatar, "avatar")
    }
}
