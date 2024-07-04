//
//  ContentView.swift
//  MediaX
//
//  Created by King OJ on 12/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        BaseView()
    }
}

#Preview {
    ContentView()
        .environmentObject(BaseViewModel())
}
