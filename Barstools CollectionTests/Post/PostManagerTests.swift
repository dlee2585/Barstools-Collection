//
//  PostManagerTests.swift
//  Barstools CollectionTests
//
//  Created by David Lee on 3/7/22.
//

import XCTest
@testable import Barstools_Collection

class PostManagerTests: XCTestCase {
    private var postService = MockPostService()

    private lazy var postManager = PostManager(postService: postService)
    
    private var successExpectation: XCTestExpectation?
    
    private var failureExpectation: XCTestExpectation?
    
    private var onPostsFetched: (([Post]) -> Void)?
    
    private var onPostFetched: ((Post) -> Void)?

    
    override func setUp() {
        super.setUp()
        postService = MockPostService()
        postManager = PostManager(postService: postService)
        postManager.delegate = self
        successExpectation = nil
        failureExpectation = nil
        onPostsFetched = nil
    }
    
    func testPostsIsSetIfFetchPostsIsSuccessful() {
        let mockPosts: [Post] = [
            .mock,
            .mock,
            .mock
        ]
        
        postService.mockPosts = mockPosts
        let expectation = expectation(description: "successful fetchPosts")
        successExpectation = expectation
        onPostsFetched = { posts in
            XCTAssertEqual(posts, mockPosts)
        }
        
        postManager.fetchPosts()
        
        wait(for: [expectation], timeout: 0.1)
        XCTAssertEqual(postManager.posts, mockPosts)
        
    }
    
    func testPostsIsNotSetIfFetchPostsIsUnsucessful() {
        postService.mockPosts = nil
        
        let expectation = expectation(description: "failed fetchPosts")
        failureExpectation = expectation
        
        postManager.fetchPosts()
        
        wait(for: [expectation], timeout: 0.1)
        XCTAssertTrue(postManager.posts.isEmpty)
    }
    
    func testFetchPostIsSuccessful() {
        postService.mockPost = .mock
        let expectation = expectation(description: "successful fetchPost")
        successExpectation = expectation
        onPostFetched = { post in
            XCTAssertEqual(post, .mock)
        }
        
        postManager.fetchPost(post: .mock)
        
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testFetchPostIsUnsuccessful() {
        postService.mockPost = nil
        
        let expectation = expectation(description: "failed fetchPost")
        failureExpectation = expectation
        
        postManager.fetchPost(post: .mock)
        
        wait(for: [expectation], timeout: 0.1)        
    }
}

extension PostManagerTests: PostManagerDelegate {
    func didUpdatePosts(_ postManager: PostManager, posts: [Post]) {
        successExpectation?.fulfill()
        onPostsFetched?(posts)
    }
    
    func didFailWithError(_ postManager: PostManager, error: Error) {
        failureExpectation?.fulfill()
    }
    
    func didFetchPost(_ postManager: PostManager, post: Post) {
        successExpectation?.fulfill()
        onPostFetched?(post)
    }
}
