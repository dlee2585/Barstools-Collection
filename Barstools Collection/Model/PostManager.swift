//
//  PostManager.swift
//  Barstools Collection
//
//  Created by David Lee on 1/5/22.
//

import Foundation

protocol PostManagerDelegate: AnyObject {
    func didUpdatePost(_ postManager: PostManager, posts: [Post])
    func didFailWithError(_ postManager: PostManager, error: Error)
}

class PostManager {
    
    var post: [Post] = []
    
    weak var delegate: PostManagerDelegate?
    
    private let webURL = "https://union.barstoolsports.com/v2/stories/latest?type=standard_post&page=1&limit25"
    
    private let postURL = "https://union.barstoolsports.com/v2/stories/"
    
    func fetchInfo() {
        NetworkManager.shared.performRequest(with: webURL, [Post].self) { posts in
            self.post = posts
            self.delegate?.didUpdatePost(self, posts: posts)
        } onError: { error in
            self.delegate?.didFailWithError(self, error: error)
        }

    }
    
    func fetchPost(_ post: Post, onCompletion: @escaping (Post) -> Void, onError: @escaping (Error) -> Void) {
        let url = "\(postURL)\(post.id)"
        
        NetworkManager.shared.performRequest(with: url, Post.self, onCompletion: onCompletion, onError: onError)
    }
    
}

