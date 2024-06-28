//
//  ContentView.swift
//  MediaX
//
//  Created by King OJ on 12/06/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var baseViewModel = BaseViewModel()
    
    var body: some View {
        BaseView()
            .environmentObject(baseViewModel)
    }
}

#Preview {
    ContentView()
}
