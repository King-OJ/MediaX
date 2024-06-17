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

extension Binding {
func onUpdate(_ closure: @escaping () -> Void) -> Binding<Value> {
    Binding(get: {
        wrappedValue
    }, set: { newValue in
        wrappedValue = newValue
        closure()
    })
}}

struct MainTab: View {
    
//    init() {
//           UITabBar.appearance().unselectedItemTintColor = UIColor.blue
//        }
    
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
                        selectedTab == .chats ?
                        Label("Chats", systemImage: "message")
                        :
                        Label("", systemImage: "message");
                        
                    }
                    .tag(Tabs.chats)
                    
                
                
                SearchView()
                    .tabItem {
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
            .toolbarBackground(Color("primary500"), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            
        }
        .tint(.white)
    }
    
   
}

#Preview {
    MainTab()
}
