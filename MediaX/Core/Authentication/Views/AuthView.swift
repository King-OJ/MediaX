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
