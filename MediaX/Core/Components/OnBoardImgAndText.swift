//
//  OnBoardImgAndText.swift
//  MediaX
//
//  Created by King OJ on 12/06/2024.
//

import SwiftUI

struct OnBoardImgAndText: View {
    
    @Binding var index: Int
    var image: String
    var text: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .topTrailing) {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth:0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity)
                    .overlay {
                        Color(.black)
                            .opacity(0.3)
                    }
                   
               
                if index != 2 {
                    Button(action: {
                        index = 2
                    }, label: {
                        Text("Skip")
                    })
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.trailing,30)
                    .padding(.top, 60)
                    
                }
            }
            
            Text(text)
                .padding(.horizontal)
                .padding(.bottom, 60)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(maxWidth: 400, alignment: .leading)
                
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .clipShape(.rect(
            topLeadingRadius: 10,
            bottomLeadingRadius: 30,
            bottomTrailingRadius: 30,
            topTrailingRadius: 10
        ))
        
        
    }
}

#Preview {
    OnBoardImgAndText(index: .constant(1), image: "profile-img", text: "Welcome to the Fun iChat")
}
