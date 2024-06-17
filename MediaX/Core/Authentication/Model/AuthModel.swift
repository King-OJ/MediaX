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
    case newUser
    case oldUser
}

class AuthModel: ObservableObject, Observable {
    @Published var user: newUser?
    @Published var authState: AuthState = .signedOut
    @Published var userState: UserState = .oldUser
    @Published var userSession: String? = nil
    
//    init(user: User? = nil, authState: AuthState, userState: UserState, userSession: String? = nil) {
//        self.user = .init(fullname: "Clement", email: "clem@gmail.com", password: "1234")
//        self.authState = .signedOut
//        self.userState = .oldUser
//        self.userSession = nil
//    }
    
    
    
    func loginUser(){
        print("login user")
        self.authState = .signedIn
    }
    
    
    func signUpUser(){
        print("SignUp user")
        self.authState = .signedIn
    }
}

struct newUser: Identifiable {
    var id = UUID()
    var fullname: String
    var username: String
    var email: String
    var password: String
}
