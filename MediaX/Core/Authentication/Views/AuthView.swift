//
//  AuthView.swift
//  MediaX
//
//  Created by King OJ on 14/06/2024.
//

import SwiftUI

enum ActionType {
    case login
    case signUp
}

struct AuthView: View {
    var actionType: ActionType
    
    @EnvironmentObject var authViewModel: AuthModel
    
    var body: some View { 
        if actionType == .signUp {
            SignUpView()
                .environment(authViewModel)
                
        }
        else
        {
            if authViewModel.userSession != nil {
                SignInView()
                    .environment(authViewModel)
            }
            else {
                MainTab()
            }
            
        }
        
        
    }
}

#Preview {
    AuthView(actionType: .login)
        .environment(AuthModel())
}
