//
//  BaseViewModel.swift
//  MediaX
//
//  Created by King OJ on 28/06/2024.
//

import Foundation

class BaseViewModel: ObservableObject, Observable {
    @Published var userFlow: UserFlow = .loading
    
    init(){
         //You might check for login state here
         //IF logged in, then go to home, otherwise
         //go back to login.
         userFlow = .loading
    }
    
    enum UserFlow {
        case loading, onboarding, authentication , mainTab
    }
}
