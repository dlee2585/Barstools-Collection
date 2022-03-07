//
//  MockPostService.swift
//  Barstools CollectionTests
//
//  Created by David Lee on 3/7/22.
//

import Foundation
@testable import Barstools_Collection

enum MockError: Error {
    case error
}

class MockPostService: PostProvidable {
    
    var mockPosts: [Post]?
    var mockPost: Post?
    
    func fetchPosts(onCompletion: @escaping ([Post]) -> Void, onError: @escaping (Error) -> Void) {
        guard let mockPosts = mockPosts else {
            onError(MockError.error)
            return
        }
        onCompletion(mockPosts)
    }
    
    func fetchPost(_ post: Post, onCompletion: @escaping (Post) -> Void, onError: @escaping (Error) -> Void) {
        guard let mockPost = mockPost else {
            onError(MockError.error)
            return
        }
        onCompletion(mockPost)

    }
}
