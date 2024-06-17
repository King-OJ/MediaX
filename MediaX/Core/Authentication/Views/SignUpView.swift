//
//  SignUpView.swift
//  MediaX
//
//  Created by King OJ on 13/06/2024.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var name = ""
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
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
                                Text("Welcome")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                
                                Text("Create account to keep exploring amazing destinations around the world")
                                    .foregroundStyle(.gray)
                                    .font(.subheadline)
                            }
                            
                            Spacer()
                        }
                        
                        //input container
                        VStack(spacing: 16, content: {
                            
                            FloatingTextField(placeHolderText: "Name", value: name)
                            
                            FloatingTextField(placeHolderText: "Username", value: username)
                            
                            FloatingTextField(placeHolderText: "Email", value: email)
                            
                            
                            FloatingTextField(placeHolderText: "Password", value: password)
                            
                            InputAndIconView(value: password, placeHolder: "Enter your password", icon: "lock", type: "password")
                            
                            InputAndIconView(value: confirmPassword, placeHolder: "Confirm your password", icon: "lock", type: "password")
                        })
                        .padding(.vertical)
                        
                        //actions button
                        VStack(spacing: 14, content: {
                            CTAbutton(text: "Create Account", icon: "arrow.right", type: .actionBtn, action: {
                                authViewModel.signUpUser()
                            })
                            HStack {
                                Text("Already have an account?")
                                
                                if authViewModel.userState == .oldUser {
                                    Button {
                                        dismiss()
                                    } label: {
                                        Text("Log In")
                                            .foregroundStyle(Color("primary500"))
                                            .fontWeight(.semibold)
                                    }

                                }
                                else{
                                    NavigationLink("Log In") {
                                        SignInView()
                                            .environmentObject(AuthModel())
                                    }.foregroundStyle(Color("primary500"))
                                        .fontWeight(.semibold)
                                }
                                
                            }
                            .font(.subheadline)
                        }).padding(.bottom)
                        
                        Spacer()
                        
                        
                        Text("By creating an account, you agree to our terms & conditions and you agree to privacy policy")
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 40)
                    .frame(maxWidth: .infinity, maxHeight: 750)
                    .background(.white)
                    .clipShape(.rect(topLeadingRadius: 30, topTrailingRadius: 30, style: .continuous)
                    )
                    
                }
                .toolbar {
                         ToolbarItem(placement: .principal) {
                             Text("Create Account")
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
    SignUpView()
        .environmentObject(AuthModel())
}
