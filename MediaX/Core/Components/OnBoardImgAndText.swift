//
//  OnBoardImgAndText.swift
//  MediaX
//
//  Created by King OJ on 12/06/2024.
//

import SwiftUI

struct OnBoardImgAndText: View {
    
    @Binding var index: Int
    var authViewModel: AuthModel
    var image: String
    var text: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ZStack(alignment: .topTrailing) {
                Image(image)
                    .resizable()
                    .frame(width:400, height: 700)
                    .scaledToFit()
                    .overlay {
                        Color(.black)
                            .opacity(0.3)
                }
               
                if index != 2 {
                    NavigationLink {
                        if authViewModel.authState == .signedIn {
                            MainTab()
                                .navigationBarBackButtonHidden()
                        }
                        else {
                            AuthView()
                                .navigationBarBackButtonHidden()
                                .environment(authViewModel)
                        }
                        
                    } label: {
                        Text("Skip")
                    }.fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.trailing,30)
                        .padding(.top, 40)
                    
                }
            }
            
            Text(text)
                .frame(maxWidth: 400, alignment: .leading)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding(.bottom, 60)
                .padding(.horizontal)
            
            
        }
        .clipShape(RoundedRectangle(cornerRadius:50))
        
    }
}

#Preview {
    OnBoardImgAndText(index: .constant(1), authViewModel: AuthModel(), image: "profile-img", text: "Welcome to the Fun iChat")
}
