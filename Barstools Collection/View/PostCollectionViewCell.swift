//
//  PostCollectionViewCell.swift
//  Barstools Collection
//
//  Created by David Lee on 1/5/22.
//

import Foundation
import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PostCollectionViewCell"
    
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var postLabel: UILabel!
    
    // Configure subviews when cell is initialized from the nib for the first time
    override func awakeFromNib() {
        super.awakeFromNib()
        postLabel.numberOfLines = 0
    }
    
    // Reset subviews when it is dequeued to be reused
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
        postLabel.text = nil
    }
    
    // Configure cell based on a post
    func setPost(_ post: Post) {
        postImageView.setImage(url: post.thumbnail.small)
        postLabel.text = post.title
    }
}
