//
//  SplashView.swift
//  MediaX
//
//  Created by King OJ on 12/06/2024.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Image("Bg image")
                .resizable()
                .scaledToFit()
   
            VStack {
                Image("Logo Mark")
                    .resizable()
                .frame(width: 100, height: 100)
                
                Spacer()
                
                Text("MEDIA X")
                    .foregroundStyle(.white)
            }
            .frame(maxHeight: 400)
            .padding(.bottom, 100)
                
                

   
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            Color("primary500")
        }
        .ignoresSafeArea()
        
        

        
    }
}

#Preview {
    SplashView()
}
