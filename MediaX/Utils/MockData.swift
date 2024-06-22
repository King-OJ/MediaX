//
//  MockData.swift
//  MediaX
//
//  Created by King OJ on 16/06/2024.
//

import Foundation

class MockData: ObservableObject {
    var posts: [Post] = [
        .init(title: "Today was a good day, I had a fantastic holiday at Home", imageUrl: "post-img1", postedBy: .init(fullname: "King OJ", username: "Talk2Clem", occupation: "Artist", bio: "Fine Guy", profileImgUrl: "profile-img5", followers: 10, following: 500), likesCount: 150, CommentsCount: 12),
        .init(title: "Today was a good day, I had a fantastic holiday at Home", imageUrl: "post-img2", postedBy: .init(fullname: "Laju Putey", username: "HighlightBaby", occupation: "Gym Trainer", bio: "Fine Guy", profileImgUrl: "profile-img4", followers: 10, following: 500), likesCount: 150, CommentsCount: 12),
        .init(title: "Today was a good day, I had a fantastic holiday at Home", imageUrl: "post-img3", postedBy: .init(fullname: "Winning Baby", username: "SurePlug", occupation: "Dancer", bio: "Fine Guy", profileImgUrl: "profile-img3", followers: 10, following: 500), likesCount: 150, CommentsCount: 12),
        .init(title: "Today was a good day, I had a fantastic holiday at Home", imageUrl: "post-img4", postedBy: .init(fullname: "Don Clemino", username: "Baddest04", occupation: "Artist", bio: "Fine Guy", profileImgUrl: "profile-img2", followers: 10, following: 500), likesCount: 150, CommentsCount: 12),
        .init(title: "Today was a good day, I had a fantastic holiday at Home", imageUrl: "post-img5", postedBy: .init(fullname: "MAchine PH", username: "PH_Boss", occupation: "Student", bio: "Fine Guy", profileImgUrl: "profile-img6", followers: 10, following: 500), likesCount: 150, CommentsCount: 12),
        .init(title: "Today was a good day, I had a fantastic holiday at Home", imageUrl: "post-img1", postedBy: .init(fullname: "AKala Makala", username: "Aki Nnemo", occupation: "Teacher", bio: "Fine Guy", profileImgUrl: "profile-img", followers: 10, following: 500), likesCount: 150, CommentsCount: 12),
    ]
    
    
}
