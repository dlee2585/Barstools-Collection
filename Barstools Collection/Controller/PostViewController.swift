//
//  PostViewController.swift
//  Barstools Collection
//
//  Created by David Lee on 1/5/22.
//

import Foundation
import UIKit

class PostViewController: UIViewController {
    
    private let post: Post
    
    @IBOutlet var postView: PostView!
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postView.setPost(post)
    }
}
