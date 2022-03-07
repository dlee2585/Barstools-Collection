//
//  Post+Mock.swift
//  Barstools CollectionTests
//
//  Created by David Lee on 3/7/22.
//

@testable import Barstools_Collection

extension Post {
    static let mock = Post(id: 1, title: "title", thumbnail: .mock, author: .mock, typeMeta: .mock)
}

extension Post.TypeMeta {
    static let mock = Post.TypeMeta(standardPost: .mock)
}

extension Post.StandardPost {
    static let mock = Post.StandardPost(content: "content")
}
