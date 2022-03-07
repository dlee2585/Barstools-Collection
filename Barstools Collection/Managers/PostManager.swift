//
//  PostManager.swift
//  Barstools Collection
//
//  Created by David Lee on 1/5/22.
//

import Foundation

/// PostManagerDelegate
///
/// The object that conforms to this protocol must implement the following methods.
/// The conformer then can be set as the PostManager's delegate and listen for events.
protocol PostManagerDelegate: AnyObject {
    func didUpdatePosts(_ postManager: PostManager, posts: [Post])
    func didFetchPost(_ postManager: PostManager, post: Post)
    func didFailWithError(_ postManager: PostManager, error: Error)
    
}

/// PostManager
///
///  This class handles the storing of data
class PostManager {
    
    var posts: [Post] = []
    
    weak var delegate: PostManagerDelegate?
    
    private let postService: PostProvidable
    
    init(postService: PostProvidable = PostService()) {
        self.postService = postService
    }
    
    func fetchPosts() {
        postService.fetchPosts { posts in
            self.posts = posts
            self.delegate?.didUpdatePosts(self, posts: posts)
        } onError: { error in
            self.delegate?.didFailWithError(self, error: error)
        }
    }
    
    func fetchPost(post: Post) {
        postService.fetchPost(post) { post in
            self.delegate?.didFetchPost(self, post: post)
        } onError: { error in
            self.delegate?.didFailWithError(self, error: error)
        }
    }
}
    
   

