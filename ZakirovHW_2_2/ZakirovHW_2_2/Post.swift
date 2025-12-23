//
//  Post.swift
//  ZakirovIOS5_HW2_1(2)
//
//  Created by Rus Zakirov on 16.11.2025.
//

import Foundation

// MARK: Модель публикации
public struct Post {
    
    public let author: String
    public let description: String
    public let image: String
    public let likes: Int
    public let views: Int
    
    public init(
        author: String,
        description: String,
        image: String,
        likes: Int,
        views: Int
    ){
        self.author = author
        self.description = description
        self.image = image
        self.likes = likes
        self.views = views
    }
    
} // Post
