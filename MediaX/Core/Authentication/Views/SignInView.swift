//
//  SignInView.swift
//  MediaX
//
//  Created by King OJ on 13/06/2024.
//

import SwiftUI

struct SignInView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authViewModel: AuthModel
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        if authViewModel.authState == .signedIn {
            MainTab()
        }
        else {
            NavigationStack {
                VStack {
                    Spacer()
                    
                    VStack() {
                        
                        //title and subtitle
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Welcome back!")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                
                                Text("Log into your account to keep exploring amazing destinations around the world")
                                    .foregroundStyle(.gray)
                                    .font(.subheadline)
                            }
                            
                            Spacer()
                        }
                        
                        //input container
                        VStack(spacing: 16, content: {
                            
                            InputAndIconView(value: email, placeHolder: "Enter your email", icon: "message")
                            
                            InputAndIconView(value: password, placeHolder: "Enter your password", icon: "lock", type: "password")
                            
                        })
                        .padding(.vertical)
                        
                        //actions button
                        VStack(spacing: 14, content: {
                            CTAbutton(text: "Login Account", icon: "arrow.right", type: .actionBtn, action: {
                                    authViewModel.loginUser()
                                }
                            )
                            
                            HStack {
                                Text("Don't have an account yet?")
                                
                                if authViewModel.userState == .newUser {
                                    Button {
                                        dismiss()
                                    } label: {
                                        Text("Create Account")
                                            .foregroundStyle(Color("primary500"))
                                            .fontWeight(.semibold)
                                    }

                                }
                                else{
                                    NavigationLink("Create Account") {
                                        SignUpView()
                                            .environmentObject(AuthModel())
                                    }.foregroundStyle(Color("primary500"))
                                        .fontWeight(.semibold)
                                }
                                
                               

                                
                            }
                            .font(.subheadline)
                            
                        }).padding(.bottom)
                        
                        Spacer()
                        
                        
                        HStack {
                            Text("Can't login?")
                            
                            NavigationLink {
                                //
                            } label: {
                                Text("Forgot Password")
                                    .foregroundStyle(Color("primary500"))
                                    .fontWeight(.semibold)
                            }

                            
                        }.font(.footnote)
                            
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 40)
                    .frame(maxWidth: .infinity, maxHeight: 700)
                    .background(.white)
                    .clipShape(.rect(topLeadingRadius: 50, topTrailingRadius: 50, style: .continuous)
                    )
                    
                }
                .toolbar {
                         ToolbarItem(placement: .principal) {
                             Text("Login Account")
                                 .foregroundColor(.white)
                                 .fontWeight(.bold)
                                 .font(.title3)
                         }
                     }
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                .background {
                    Color("primary500")
                }
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    SignInView()
        .environmentObject(AuthModel())
}