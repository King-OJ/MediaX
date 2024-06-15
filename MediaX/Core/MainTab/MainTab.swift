//
//  MainTab.swift
//  MediaX
//
//  Created by King OJ on 14/06/2024.
//

import SwiftUI

private enum Tabs {
    case home
    case chats
    case search
    case profile
}

struct MainTab: View {
    var body: some View {
        
        @State var selectedTab: Tabs = .home
        @State var index: Tabs = .home
        
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tabs.home)
            
            MessagesView()
                .tabItem {
                    Image(systemName: "message")
                    if index == .chats {
                        Text("Chats")
                    }
                }
                .tag(Tabs.chats)
            
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(Tabs.search)
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(Tabs.profile)
        }
        .tint(Color("primary500"))
        .onChange(of: selectedTab) { oldValue, newValue in
            index = newValue
        }
    }
}

#Preview {
    MainTab()
}
