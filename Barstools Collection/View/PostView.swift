//
//  PostView.swift
//  Barstools Collection
//
//  Created by David Lee on 1/5/22.
//

import Foundation
import UIKit
import WebKit

class PostView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    // Configure subviews when cell is initialized from the nib for the first time
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.numberOfLines = 0
    }
    
    func setPost(_ post: Post) {
        titleLabel.text = post.title
        
        guard let htmlString = post.typeMeta.standardPost?.content else {
            return
        }
        
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
}
