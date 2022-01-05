//
//  PostManager.swift
//  Barstools Collection
//
//  Created by David Lee on 1/5/22.
//

import Foundation

class PostManager {
    
    var post: [Post] = []
    
    private let webURL = "https://union.barstoolsports.com/v2/stories/latest?type=standard_post&page=1&limit25"
    
    private let postURL = "https://union.barstoolsports.com/v2/stories/"
    
    func fetchInfo() {
        NetworkManager.shared.performRequest(with: webURL, [Post].self) { posts in
            self.post = posts
            print(posts)
        } onError: { error in
            print(error)
        }

    }
    
    func fetchPost(_ post: Post, onCompletion: @escaping (Post) -> Void, onError: @escaping (Error) -> Void) {
        let url = "\(postURL)\(post.id)"
        
        NetworkManager.shared.performRequest(with: url, Post.self, onCompletion: onCompletion, onError: onError)
    }
    
}

