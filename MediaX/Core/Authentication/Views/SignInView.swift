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
    @EnvironmentObject var baseViewModel: BaseViewModel
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
       
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
                    VStack(spacing: 20, content: {
                        
                        FloatingTextField(placeHolderText: "Email", inputType: .email, icon: "envelope", value: email)
                        
                        
                        FloatingTextField(placeHolderText: "Password",inputType: .password, icon:"lock", value: password)
                        
                    })
                    .padding(.vertical)
                    
                    //actions button
                    VStack(spacing: 14, content: {
                        Button {
                            baseViewModel.userFlow = .mainTab
                        } label: {
                            CTAbutton(text: "Login Account", icon: "arrow.right"
                            )
                            .background {
                                Color("primary500")
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                        }

                       
                        
                        HStack {
                            Text("Don't have an account yet?")
                            
                            if authViewModel.userState == .oldUser {
                                NavigationLink {
                                    SignUpView()
                                        .navigationBarBackButtonHidden()
                                        .environment(authViewModel)
                                    
                                } label: {
                                    Text("Create Account")
                                        .foregroundStyle(Color("primary500"))
                                        .fontWeight(.semibold)
                                }
                            }
                            else {
                                Button {
                                    dismiss()
                                } label: {
                                    Text("Create Account")
                                        .foregroundStyle(Color("primary500"))
                                        .fontWeight(.semibold)
                                }

                            }
                            

                            
                           

                            
                        }
                        .font(.subheadline)
                        
                    }).padding(.vertical)
                    
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
                .frame(minWidth: 350, maxWidth: .infinity, minHeight: 600, maxHeight: 700)
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
                
                if authViewModel.userState == .newUser {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "chevron.left")
                        })
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        
                    }
                }
                
            }
            .frame(maxWidth:.infinity)
            .background {
                Color("primary500")
            }
            .ignoresSafeArea()
        
       
    }
}

#Preview {
    SignInView()
        .environmentObject(AuthModel())
}
