//
//  SplashView.swift
//  MediaX
//
//  Created by King OJ on 12/06/2024.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    var body: some View {
        
        ZStack() {
            Image("Bg image")
                .resizable()
                .scaledToFill()
                
   
            VStack {
                Image("Logo Mark")
                    .resizable()
                .frame(width: 100, height: 100)
                
                Spacer()
                
                Text("MEDIA X")
                    .foregroundStyle(.white)
            }
            .frame(maxHeight: 150)
            .padding(.bottom, 100)
                
                

   
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            Color("primary500")
        }
        .ignoresSafeArea()
        .onAppear {
            withAnimation(Animation.linear.delay(0.5)) {
                baseViewModel.userFlow = .onboarding
               }
        }
        
        

        
    }
}

#Preview {
    SplashView()
        .environment(BaseViewModel())
}
