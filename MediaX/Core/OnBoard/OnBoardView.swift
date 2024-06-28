//
//  OnBoardView.swift
//  MediaX
//
//  Created by King OJ on 12/06/2024.
//

import SwiftUI

struct OnBoardView: View {
//    @StateObject var authViewModel = AuthModel()
//    let screenWidth = UIScreen.main.bounds.size.width
    @EnvironmentObject var baseViewModel: BaseViewModel
   
    
    @State private var index = 0
    
    //mock data
    var onBoardTabs: [Tab] = [.init(image: "chat-img", text: "Welcome To the Fun Media X"), .init(image: "chat-img3", text: "Best Social App to Make New Friends"),
        .init(image: "chat-img2", text: "Enjoy Your Life Everytime, Everywhere")]
    
    var body: some View {
        
        NavigationStack {
            VStack {
                //onboard tabs
                TabView(selection: $index) {
                    ForEach(Array(onBoardTabs.enumerated()), id: \.offset){ index,
                        tab in
                        OnBoardImgAndText(index: $index, image: tab.image, text: tab.text)
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
                            
                            Button {
                                baseViewModel.userFlow = .authentication
                                   
                            } label: {
                                CTAbutton(text: "Get Started")
                                    .frame(maxWidth: .infinity)
                                .background{
                                    Color("primary500")
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                            }
                            

//                            NavigationLink {
//                                AuthView()
//                                    .environmentObject(authViewModel)
//                                    .navigationBarBackButtonHidden()
//                                
//                            } label: {
//                                CTAbutton(text: "Log In")
//                                .frame(maxWidth: screenWidth/2)
//                                .background{
//                                    Color("primary500")
//                                }
//                                .clipShape(RoundedRectangle(cornerRadius: 6))
//                            }
                            
                           
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
        .environment(BaseViewModel())
}

struct Tab {
    var image: String
    var text: String
}
