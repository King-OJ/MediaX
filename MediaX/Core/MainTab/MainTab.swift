//
//  MainTab.swift
//  MediaX
//
//  Created by King OJ on 14/06/2024.
//

import SwiftUI

struct MainTab: View {
    
    @State var selectedTab: Tabs = .home
    
    enum Tabs {
        case home, chats, search, profile
    }
    
    @EnvironmentObject var baseViewModel: BaseViewModel
    let screenWidth: CGFloat = UIScreen.current?.bounds.width ?? 0
    let screenHeight: CGFloat = UIScreen.current?.bounds.height ?? 0
    
    @State private var showAddPost = false
    
    var body: some View {
        ZStack(content: {
            TabView(selection: $selectedTab) {
                Group {
                    HomeView()
                        .tabItem {
                            selectedTab == .home ?
                            Label("Home", systemImage: "house")
                            :
                            Label("", systemImage: "house")
                        }
                        .tag(Tabs.home)
                    
                    MessagesView()
                        .tabItem {
                            selectedTab == .chats ?
                            Label("chats", systemImage: "message")
                            :
                            Label("", systemImage: "message")
                        }
                        .tag(Tabs.chats)
                    
                    NavigationStack {
                    SearchView()
                            .navigationTitle("Search")
                    }.tabItem {
                        selectedTab == .search ?
                        Label("Search", systemImage: "magnifyingglass")
                        :
                        Label("", systemImage: "magnifyingglass")
                    }
                    .tag(Tabs.search)
                    
                    ProfileView(currentTab: $selectedTab, user: baseViewModel.user)
                        .tabItem {
                            selectedTab == .profile ?
                            Label("Profile", systemImage: "person")
                            :
                            Label("", systemImage: "person")
                        }
                        .tag(Tabs.profile)
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color("primary500"), for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
         
            }
            .tint(.white)
            
            Button {
                showAddPost.toggle()
            } label: {
                Text("+")
                    .font(.system(size: 40))
                    .fontWeight(.semibold)
            }
            .foregroundStyle(.white)
            .padding()
            .background(Color("primary500").opacity(0.9))
            .clipShape(Circle())
            .offset(x: screenWidth/2 - 30, y: screenHeight/2 - 140)
            .fullScreenCover(isPresented: $showAddPost, content: {
                CreatePostView()
            })
            
        })
        
        
        
        
        
    }
    
   
}

#Preview {
    MainTab()
        .environmentObject(BaseViewModel())
}
