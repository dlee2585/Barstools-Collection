//
//  Post.swift
//  Barstools Collection
//
//  Created by David Lee on 1/5/22.
//

import Foundation

struct Post: Decodable {
    let id: Int
    let thumbnail: Thumbnail
    let author: Author
    let typeMeta: TypeMeta
    
    enum CodingKeys: String, CodingKey {
        case id
        case thumbnail
        case author
        case typeMeta = "post_type_meta"
    }
}
