//
//  OnBoardImgAndText.swift
//  MediaX
//
//  Created by King OJ on 12/06/2024.
//

import SwiftUI

struct OnBoardImgAndText: View {
    var image: String
    var text: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(image)
                .resizable()
                .frame(width:400, height: 700)
                .scaledToFit()
                .overlay {
                    Color(.black)
                        .opacity(0.3)
                }
            
            
            Text(text)
                .frame(maxWidth: 400, alignment: .leading)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding(.bottom, 60)
                .padding(.leading)
            
            
        }
        .clipShape(RoundedRectangle(cornerRadius:30))
        .ignoresSafeArea()
    }
}

#Preview {
    OnBoardImgAndText(image: "profile-img", text: "Welcome to the Fun iChat")
}
