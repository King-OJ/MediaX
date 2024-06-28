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
 
    var body: some View {
   
        @State var selectedTab: Tabs = .home
        
        TabView(selection: $selectedTab) {
            Group {
                HomeView()
                    .tabItem {
                        selectedTab == .home ?
                        Label("Home", systemImage: "house")
                        :
                        Label("", systemImage: "house");
                        
                    }
                    .tag(Tabs.home)
                
                MessagesView()
                    .tabItem {
                        Label("Chats", systemImage: "message")
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
            .toolbarBackground(Color("primary500"), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
            
            
        }
        .tint(.white)
    }
    
   
}

#Preview {
    MainTab()
}
