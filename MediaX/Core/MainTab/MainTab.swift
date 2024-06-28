//
//  MainTab.swift
//  MediaX
//
//  Created by King OJ on 14/06/2024.
//

import SwiftUI
import UIKit

private enum Tabs: Hashable {
    case home
    case chats
    case search
    case profile
}



struct MainTab: View {
    
    @State private var selectedTab: Tabs = .home
    
    
    var body: some View {
        
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
                
                ProfileView()
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
        
    }
    
   
}

#Preview {
    MainTab()
}
