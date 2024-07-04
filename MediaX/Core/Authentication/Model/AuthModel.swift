//
//  AuthModel.swift
//  MediaX
//
//  Created by King OJ on 14/06/2024.
//

import Foundation

enum AuthState {
    case authenticated // Anonymously authenticated in Firebase.
    case signedIn // Authenticated in Firebase using one of service providers, and not anonymous.
    case signedOut // Not authenticated in Firebase.
}

enum UserState {
    case newUser, oldUser
}

class AuthModel: ObservableObject, Observable {
    @Published var user: User? = nil
    @Published var authState: AuthState = .signedOut
    @Published var userState: UserState = .oldUser
    @Published var userSession: String? = nil
    
//    init(user: User? = nil) {
//        self.user = .init(fullname: "Winning Baby", username: "SurePlug", occupation: "Dancer", bio: "Fine Guy", profileImgUrl: "profile-img3", followers: 10, following: 500)
//      
//    }
    
    func loginUser(){
        self.user = .init(fullname: "Winning Baby", username: "SurePlug", occupation: "Dancer", bio: "Fine Guy", profileImgUrl: "profile-img3", followers: 10, following: 500)
    }
    
    func loginOut(){
        self.user = nil
    }
    
    func signUpUser(){
        self.user = .init(fullname: "Winning Baby", username: "SurePlug", occupation: "Dancer", bio: "Fine Guy", profileImgUrl: "profile-img3", followers: 10, following: 500)
    }
    
    func oldUserUI(){
        print("old user")
        self.userState = .oldUser
    }
    
}

struct newUser: Identifiable {
    var id = UUID()
    var fullname: String
    var username: String
    var email: String
    var password: String
}
