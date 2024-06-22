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
    
    init() {
           UITabBar.appearance().unselectedItemTintColor = UIColor.blue
        }
    
    
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
                    .onAppear(perform: {
                        selectedTab = .home
                    })
                    .tag(Tabs.home)
                
                MessagesView()
                    .tabItem {
                        Label("Chats", systemImage: "message")
                    }
                    .onAppear(perform: {
                        selectedTab = .chats
                    })
                    .tag(Tabs.chats)
                    
                
                
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                    .onAppear(perform: {
                        selectedTab = .search
                    })
                    .tag(Tabs.search)
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
                    .onAppear(perform: {
                        selectedTab = .profile
                    })
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
