//
//  SearchView.swift
//  MediaX
//
//  Created by King OJ on 14/06/2024.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
     
            Text("Search View")
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                       
                            Image(systemName: "gear")
                       
                        .foregroundStyle(.black)
                       
                        
                    }
                })
                
    }
}

#Preview {
    SearchView()
}
