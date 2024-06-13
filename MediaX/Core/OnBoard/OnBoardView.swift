//
//  OnBoardView.swift
//  MediaX
//
//  Created by King OJ on 12/06/2024.
//

import SwiftUI

struct OnBoardView: View {
    
    var onBoardTabs: [Tab] = [.init(image: "chat-img", text: "Welcome To the Fun Media X"), .init(image: "chat-img3", text: "Best Social App to Make New Friends"),
        .init(image: "chat-img2", text: "Enjoy Your Life Everytime, Everywhere")]
    
    var body: some View {
        VStack {
            
            TabView {
                ForEach(onBoardTabs, id: \.self){
                    tab in
                    OnBoardImgAndText(image: tab.image, text: tab.text)
                }
                
            }
            .tabViewStyle(.page)
            .ignoresSafeArea()
            
          
            //next button
            VStack {
                Button(action: {
                    print("next")
                }, label: {
                    HStack(content: {
                        Text("Next")
                        
                        Spacer()
                        
                        Image(systemName: "arrow.right")
                    })
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(height: 64)
                    .padding(.horizontal)
                    .background{
                        Color("primary500")
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                })
                .foregroundStyle(.white)
            }
            .padding()
            
        }
        
    }
}

#Preview {
    OnBoardView()
}

struct Tab: Hashable {
    var image: String
    var text: String
}
