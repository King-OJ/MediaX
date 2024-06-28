//
//  SettingsModal.swift
//  MediaX
//
//  Created by King OJ on 27/06/2024.
//

import SwiftUI

struct SettingsModal: View {
    
    @EnvironmentObject var baseViewModel: BaseViewModel
    @Environment(\.dismiss) var dismiss
    
    private var settings: [Setting] = [
        .init(title: "Edit Profile", icon: "square.and.pencil"),
        .init(title: "Language", icon: "globe"),
        .init(title: "Friends", icon: "person"),
    ]
    
    private var preferences: [Setting] = [
        .init(title: "Notifications", icon: "bell.slash"),
        .init(title: "Account & Privacy", icon: "shield"),
        .init(title: "Theme", icon: "moon"),
        .init(title: "Media X Help", icon: "questionmark.circle"),
        .init(title: "About", icon: "exclamationmark.bubble"),
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                
                VStack(spacing:25, content: {
                   
                    VStack(spacing: 30) {
                        ForEach(settings) { setting in
                            LabeledContent {
                                Image(systemName: "chevron.right")
                                    .fontWeight(.semibold)
                                
                            } label: {
                                HStack(alignment: .center, spacing: 16) {
                                    Image(systemName: setting.icon)
                                    
                                    Text(setting.title)
                                        .font(.title3)
                                    
                                }
                                
                            }
                        }
                    }
                    
                    Text("Preferences")
                        .font(.headline)
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    
                    VStack(spacing: 30) {
                        ForEach(preferences) { setting in
                            LabeledContent {
                                Image(systemName: "chevron.right")
                                    .fontWeight(.semibold)
                                
                            } label: {
                                HStack(alignment: .center, spacing: 16) {
                                    Image(systemName: setting.icon)
                                    
                                    Text(setting.title)
                                        .font(.title3)
                                    
                                }
                                
                            }
                        }
                    }
                    
                    Spacer()
                   
                    Button(action: {
                        baseViewModel.userFlow = .authentication
                    }, label: {
                        HStack(content: {
                            
                            Image(systemName: "iphone.and.arrow.forward")
                                .imageScale(.large)
                            
                            Text("Log out")
                                .font(.title2)
                        })
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        
                        .frame(maxWidth: .infinity)
                        .frame(height: 54)
                        .background {
                            Color("primary500")
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    })
                    
                    
                })
                .padding(.horizontal)
                .padding(.vertical, 40)
                .frame(minWidth: 350, maxWidth: .infinity, minHeight: 600, maxHeight: 800)
                .background(.white)
                .clipShape(.rect(topLeadingRadius: 30, topTrailingRadius: 30, style: .continuous)
                )
                .ignoresSafeArea(.container, edges: .bottom)
                
            }
            .background(Color("primary500"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Settings")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.title3)
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss();
                    }, label: {
                       Image(systemName: "chevron.left")
                            .fontWeight(.bold)
                            .font(.title3)
                        
                    }).foregroundStyle(.white)
                   
                        
                }
            }
            .toolbarBackground(Color("primary500"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct Setting: Identifiable {
    var id = UUID()
    
    var title: String
    var icon: String
}


#Preview {
    SettingsModal()
}
