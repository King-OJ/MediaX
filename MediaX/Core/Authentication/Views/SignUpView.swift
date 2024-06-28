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
                                Text("Welcome!")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                
                                Text("Create account to keep exploring amazing destinations around the world")
                                    .foregroundStyle(.gray)
                                    .font(.subheadline)
                            }
                            
                            Spacer()
                        }
                        
                        //input container
                        VStack(spacing: 20, content: {
                            
                            FloatingTextField(placeHolderText: "Name",inputType: .name,icon:"person", value: name)
                            
                            FloatingTextField(placeHolderText: "Username",inputType: .username, icon:"person.circle", value: username)
                            
                            FloatingTextField(placeHolderText: "Email",inputType: .email, icon:"envelope", value: email)
                            
                            
                            FloatingTextField(placeHolderText: "Password",inputType: .password, icon:"lock", value: password)
                            
                         
                        })
                        .padding(.vertical)
                        
                        //actions button
                        VStack(spacing: 14, content: {
                            Button {
                                baseViewModel.userFlow = .mainTab
                            } label: {
                                CTAbutton(text: "Create Account", icon: "arrow.right")
                                .background {
                                    Color("primary500")
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                            }

                           
                            
                            HStack {
                                Text("Already have an account?")
                                if authViewModel.userState == .newUser {
                                    NavigationLink("Login") {
                                        SignInView()
                                            .navigationBarBackButtonHidden()
                                            .environment(authViewModel)
                                        }
                                    .foregroundStyle(Color("primary500"))
                                    .fontWeight(.semibold)
                                }
                                else {
                                    Button("Login") {
                                        dismiss()
                                    }
                                    .foregroundStyle(Color("primary500"))
                                    .fontWeight(.semibold)
                                }
                                
                                

                               
                            }
                            .font(.subheadline)
                            
                        }).padding(.vertical)
                        
                        Spacer()
                        
                        
                        Text("By creating an account, you agree to our terms & conditions and you agree to privacy policy")
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 40)
                    .frame(minWidth: 350, maxWidth: .infinity, minHeight: 600, maxHeight: 700)
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
                    
                    if authViewModel.userState == .oldUser {
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
    SignUpView()
        .environmentObject(AuthModel())
}
