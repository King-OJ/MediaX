//
//  AuthView.swift
//  MediaX
//
//  Created by King OJ on 14/06/2024.
//

import SwiftUI

struct AuthView: View {
    
    @EnvironmentObject var authViewModel: AuthModel
    
    var body: some View {
        if authViewModel.userSession != nil {
            MainTab()
        }
        else {
            if authViewModel.userState == .newUser {
                SignUpView()
                    .environment(authViewModel)
                    
            }
            else
            {
                SignInView()
                    .environment(authViewModel)
            }
        }
        
    }
}

#Preview {
    AuthView()
        .environment(AuthModel())
}
