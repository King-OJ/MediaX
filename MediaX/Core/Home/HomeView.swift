//
//  HomeView.swift
//  MediaX
//
//  Created by King OJ on 14/06/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = MockData()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing:30,content: {
                    ForEach(viewModel.posts) { post in
                        PostView(post: post)
                    }
                    
                    
                })
                
            }.scrollIndicators(.hidden)
                
            
            
        }
       
    }
}

#Preview {
    HomeView()
}
