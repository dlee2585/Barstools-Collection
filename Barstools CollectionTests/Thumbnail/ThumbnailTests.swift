//
//  ThumbnailTests.swift
//  Barstools CollectionTests
//
//  Created by David Lee on 3/7/22.
//

import XCTest
@testable import Barstools_Collection


class ThumbnailTests: XCTestCase {
    func testInit() {
        let thumbnail = Thumbnail(type: "type", location: "location", images: .mock)
        XCTAssertEqual(thumbnail.type, "type")
        XCTAssertEqual(thumbnail.location, "location")
        XCTAssertEqual(thumbnail.images, .mock)
    }
    
    func testSmall() {
        let thumbnail = Thumbnail.mock
        XCTAssertEqual(thumbnail.small, thumbnail.location + thumbnail.images.small)
    }
    
    func testMedium() {
        let thumbnail = Thumbnail.mock
        XCTAssertEqual(thumbnail.medium, thumbnail.location + thumbnail.images.medium)
    }
    
    func testLarge() {
        let thumbnail = Thumbnail.mock
        XCTAssertEqual(thumbnail.large, thumbnail.location + thumbnail.images.large)
    }
}
