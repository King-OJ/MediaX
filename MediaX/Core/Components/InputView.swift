//
//  InputAndIconView.swift
//  MediaX
//
//  Created by King OJ on 13/06/2024.
//

import SwiftUI


struct InputAndIconView: View {
    
    @State var value: String = ""
    var placeHolder: String
    var icon: String
    var type: String?
    
    var body: some View {
        
        if type != nil && type == "password" {
            HStack(spacing: 10) {
                Image(systemName: icon)
                    
                
                SecureField(placeHolder, text: $value)
                    .padding(.vertical)
                    
            }
            .foregroundStyle(.gray)
            .padding(.horizontal)
            .frame(height: 62)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        
        else {
            HStack(spacing: 10) {
                Image(systemName: icon)
                    
                
                TextField(placeHolder, text: $value)
                    .padding(.vertical)
                    
            }
            .foregroundStyle(.gray)
            .padding(.horizontal)
            .frame(height: 62)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        
        
    }
}

#Preview {
    InputAndIconView(placeHolder: "Enter your full name", icon: "person")
}
