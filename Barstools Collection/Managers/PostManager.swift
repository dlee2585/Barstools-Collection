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
    
    private var isLoading = false
    
    init(postService: PostProvidable = PostService()) {
        self.postService = postService
    }
    
    func fetchPosts() {
        guard !isLoading else {
            return
        }
        
        isLoading = true
        
        postService.fetchPosts { posts in
            self.isLoading = false
            self.posts = posts
            self.delegate?.didUpdatePosts(self, posts: posts)
        } onError: { error in
            self.isLoading = false
            self.delegate?.didFailWithError(self, error: error)
        }
    }
    
    func fetchPost(post: Post) {
        guard !isLoading else {
            return
        }

        isLoading = true
        
        postService.fetchPost(post) { post in
            self.isLoading = false
            self.delegate?.didFetchPost(self, post: post)
        } onError: { error in
            self.isLoading = false
            self.delegate?.didFailWithError(self, error: error)
        }
    }
}
    
   

