//
//  AuthView.swift
//  MediaX
//
//  Created by King OJ on 14/06/2024.
//

import SwiftUI


struct AuthView: View {
//    var actionType: ActionType
    @StateObject var authViewModel = AuthModel()
    
    var body: some View { 
       
//        if actionType == .signUp {
//            if authViewModel.authState == .signedIn {
//                MainTab()
//            }
//            else {
//                SignUpView()
//                    .environment(authViewModel)
//            }
//                
//        }
//        else
//        {
//            if authViewModel.authState == .signedIn {
//                MainTab()
//            }
//            else {
//                SignInView()
//                    .environment(authViewModel)
//            }
//            
//        }
        
        NavigationStack{
            if authViewModel.userState == .newUser {
                SignUpView()
                    .environment(authViewModel)
            }
            else {
                SignInView()
                    .environment(authViewModel)
            }
            
            
        }
        
        
    }
}

#Preview {
    AuthView()
}
