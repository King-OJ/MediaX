//
//  PostModel.swift
//  MediaX
//
//  Created by King OJ on 16/06/2024.
//

import Foundation

struct Post: Identifiable {
    var id = UUID()
    var title: String
    var imageUrl: String
    var postedBy: User
    var likesCount: Int
    var CommentsCount: Int
}
