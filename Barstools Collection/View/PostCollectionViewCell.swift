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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        postLabel.numberOfLines = 0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
        postLabel.text = nil
    }
    
    func setPost(_ post: Post) {
        postImageView.setImage(url: post.thumbnail.small)
        postLabel.text = post.title
    }
}
