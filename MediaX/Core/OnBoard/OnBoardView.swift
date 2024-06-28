//
//  OnBoardView.swift
//  MediaX
//
//  Created by King OJ on 12/06/2024.
//

import SwiftUI

struct OnBoardView: View {
    
    let screenWidth = UIScreen.main.bounds.size.width
    
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
                            .ignoresSafeArea(.container, edges: .top)
                    }
                    
                }
                .tabViewStyle(.page)
                .padding(.bottom)
                .ignoresSafeArea(.container, edges: .top)
                
              
                //next buttons
                VStack {
                    if index == 2 {
                        HStack(spacing: 10, content: {
                            
                            NavigationLink {
                                AuthView(actionType: .signUp)
                                    .environmentObject(authViewModel)
                                    .navigationBarBackButtonHidden()
                            } label: {
                                CTAbutton(text: "Create Account")
                                .frame(maxWidth: screenWidth/2)
                                .background{
                                    Color("primary500")
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                            }

                            NavigationLink {
                                AuthView(actionType: .login)
                                    .environmentObject(authViewModel)
                                    .navigationBarBackButtonHidden()
                            } label: {
                                CTAbutton(text: "Log In")
                                .frame(maxWidth: screenWidth/2)
                                .background{
                                    Color("primary500")
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                            }
                            
                           
                        })
                    }
                    
                    else {
                        Button(action: {
                            withAnimation {
                                guard index < 2 else { return;}
                                index += 1;
                            }
                        }, label: {
                            CTAbutton(text: "Next", icon: "arrow.right")
                        })
                        .background{
                            Color("primary500")
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        
                    }
                    
                    
                }
                .foregroundStyle(.white)
                .padding()
                
            }
            .background(.white)
            
            
            
        }      
        
                
    }
}

#Preview {
    OnBoardView()
}

struct Tab {
    var image: String
    var text: String
}
