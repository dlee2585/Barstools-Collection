//
//  PostTests.swift
//  Barstools CollectionTests
//
//  Created by David Lee on 3/7/22.
//

import XCTest
@testable import Barstools_Collection


class PostTests: XCTestCase {
    func testInit() {
        let post = Post(id: 1, title: "title", thumbnail: .mock, author: .mock, typeMeta: .mock)
        XCTAssertEqual(post.id, 1)
        XCTAssertEqual(post.title, "title")
        XCTAssertEqual(post.thumbnail, .mock)
        XCTAssertEqual(post.author, .mock)
        XCTAssertEqual(post.typeMeta, .mock)
    }
}
