//
//  UserModel.swift
//  MediaX
//
//  Created by King OJ on 16/06/2024.
//

import Foundation


class UserModel: ObservableObject {
    
}

struct User: Identifiable {
    var id = UUID()
    var fullname: String
    var username: String
    var occupation: String
    var bio: String
    var profileImgUrl: String
    var followers: Int
    var following: Int
}
