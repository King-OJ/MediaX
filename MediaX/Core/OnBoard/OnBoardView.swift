//
//  OnBoardView.swift
//  MediaX
//
//  Created by King OJ on 12/06/2024.
//

import SwiftUI

struct OnBoardView: View {
    
    @StateObject var authViewModel = AuthModel()
    
    @State private var index = 0
    
    //mock data
    var onBoardTabs: [Tab] = [.init(image: "chat-img", text: "Welcome To the Fun Media X"), .init(image: "chat-img3", text: "Best Social App to Make New Friends"),
        .init(image: "chat-img2", text: "Enjoy Your Life Everytime, Everywhere")]
    
    var body: some View {
        
        NavigationStack {
            VStack {
                TabView(selection: $index) {
                    ForEach(Array(onBoardTabs.enumerated()), id: \.offset){ index,
                        tab in
                        OnBoardImgAndText(index: $index, authViewModel: authViewModel, image: tab.image, text: tab.text)
                            .tag(index)
                            .ignoresSafeArea()
                    }
                    
                }
                .tabViewStyle(.page)
                .padding(.bottom)
                .ignoresSafeArea()
                
              
                //next button
                VStack {
                    if index == 2 {
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
                            CTAbutton(text: "Get Started", icon: "arrow.right", type: .navBtn)
                        }
                        
                    }
                    
                    else {
                        Button(action: {
                            withAnimation {
                                guard index < 2 else { return;}
                                index += 1;
                            }
                        }, label: {
                            CTAbutton(text: "Next", icon: "arrow.right", type: .navBtn)
                        })
                        
                    }
                    
                    
                }
                .foregroundStyle(.white)
                .padding()
                
                
            }
            .background(.white)
            
            
            
        }.tint(.white)
        
                
    }
}

#Preview {
    OnBoardView()
}

struct Tab {
    var image: String
    var text: String
}
