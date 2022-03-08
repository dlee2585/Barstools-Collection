//
//  PostService.swift
//  Barstools Collection
//
//  Created by David Lee on 3/7/22.
//

import Foundation

protocol PostProvidable {
    func fetchPosts(onCompletion: @escaping ([Post]) -> Void, onError: @escaping (Error) -> Void)
    func fetchPost(_ post: Post, onCompletion: @escaping (Post) -> Void, onError: @escaping (Error) -> Void)
}

class PostService: PostProvidable {
    
    private let networkService = NetworkService()
    
    private let postsURL = "https://union.barstoolsports.com/v2/stories/latest?type=standard_post&page=1&limit25"
    
    private let postURL = "https://union.barstoolsports.com/v2/stories/"
    
    /// fetchPosts
    ///
    /// Attempt to fetch from the provided API.
    
    func fetchPosts(onCompletion: @escaping ([Post]) -> Void, onError: @escaping (Error) -> Void) {
        networkService.performRequest(with: postsURL, [Post].self, onCompletion: onCompletion, onError: onError)
    }
    
    /// fetchPost
    ///
    /// Attempt to fetch with the appended url.
    func fetchPost(_ post: Post, onCompletion: @escaping (Post) -> Void, onError: @escaping (Error) -> Void) {
        let url = "\(postURL)\(post.id)"
        
        networkService.performRequest(with: url, Post.self, onCompletion: onCompletion, onError: onError)
    }
}

