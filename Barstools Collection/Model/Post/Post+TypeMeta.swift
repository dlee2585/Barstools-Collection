//
//  Post+TypeMeta.swift
//  Barstools Collection
//
//  Created by David Lee on 1/5/22.
//

import Foundation

extension Post {
    struct TypeMeta: Decodable, Equatable {
        var standardPost: StandardPost?
        
        enum CodingKeys: String, CodingKey {
            case standardPost = "standard_post"
        }
    }
    
    struct StandardPost: Decodable, Equatable {
        let content: String?
    }
}
