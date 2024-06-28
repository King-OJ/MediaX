//
//  BaseView.swift
//  MediaX
//
//  Created by King OJ on 28/06/2024.
//

import SwiftUI

struct BaseView: View {
    
    @EnvironmentObject var appState: BaseViewModel
    
    var body: some View {
        Group {
            switch appState.userFlow {
            case .loading:
                SplashView()
            case .onboarding:
                OnBoardView()
            case .authentication:
                AuthView()
            case .mainTab:
                MainTab()
            }
        }
        .transition(.opacity)
        .animation(.easeInOut, value: 0.5)
         
    }
}

#Preview {
    BaseView()
        .environmentObject(BaseViewModel())
        
}
