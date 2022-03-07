//
//  ImagesTests.swift
//  Barstools CollectionTests
//
//  Created by David Lee on 3/7/22.
//

import XCTest
@testable import Barstools_Collection


class ImagesTests: XCTestCase {
    func testInit() {
        let images = Images(small: "small", medium: "medium", large: "large")
        XCTAssertEqual(images.small, "small")
        XCTAssertEqual(images.medium, "medium")
        XCTAssertEqual(images.large, "large")
    }
}
