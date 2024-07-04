//
//  BaseViewModel.swift
//  MediaX
//
//  Created by King OJ on 28/06/2024.
//

import Foundation

class BaseViewModel: ObservableObject, Observable {
    @Published var userFlow: UserFlow
    @Published var user: User?
//    @Published var user: User? = .init(fullname: "Winning Baby", username: "SurePlug", occupation: "Dancer", bio: "Fine Guy", profileImgUrl: "profile-img3", followers: 10, following: 500)
    
    
    init(){
         //You might check for login state here
         //IF logged in, then go to home, otherwise
         //go back to login.
        userFlow = .loading
        user = nil
    }
    
    func loginUser(email: String, password: String) -> User? {
        self.user = .init(fullname: "Winning Baby", username: "SurePlug", occupation: "Dancer", bio: "Fine Guy", profileImgUrl: "profile-img3", followers: 10, following: 500)
        return user;
    }

    
    enum UserFlow {
        case loading, onboarding, authentication , mainTab
    }
}
