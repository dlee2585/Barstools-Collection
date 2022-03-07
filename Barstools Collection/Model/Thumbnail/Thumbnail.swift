//
//  Thumbnail.swift
//  Barstools Collection
//
//  Created by David Lee on 1/5/22.
//

import Foundation

struct Thumbnail: Decodable, Equatable {
    let type: String
    let location: String
    let images: Images
    
    var small: String {
        location + images.small
    }
    
    var medium: String {
        location + images.medium
    }
    
    var large: String {
        location + images.large
    }    
}
