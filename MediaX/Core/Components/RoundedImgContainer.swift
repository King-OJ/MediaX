//
//  RoundedImgContainer.swift
//  MediaX
//
//  Created by King OJ on 15/06/2024.
//

import SwiftUI

struct RoundedImgContainer: View {
    var img: String
    var padding: Double
    var body: some View {
        VStack {
            Image(img)
                .resizable()
                .clipShape(Circle())
                .scaledToFill()
                
                
            
            
        }
        .padding(padding)
        .overlay(content: {
            Circle()
                .stroke(lineWidth: 4)
                .foregroundStyle(Color("primary500"))
        })
        .clipShape(Circle())
            
            
    }
}

#Preview {
    RoundedImgContainer(img: "profile-img", padding: 6)
}


