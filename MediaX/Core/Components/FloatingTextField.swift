//
//  FloatingTextField.swift
//  MediaX
//
//  Created by King OJ on 16/06/2024.
//

import SwiftUI

struct FloatingTextField: View {
    let textFieldHeight: CGFloat = 50
    let placeHolderText: String
    @State var value: String
    @State var isEditing = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $value, onEditingChanged: { (edit) in
                withAnimation(.linear) {
                    isEditing = edit
                }
                
            })
                .padding()
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color("primary500"), lineWidth: 1.0)
                })
                .frame(height: textFieldHeight)
                .animation(.linear, value: isEditing)
                
                
           
            Text(placeHolderText)
                .background(Color(UIColor.systemBackground))
                .padding(.leading)
                .offset(y: isEditing ? -28 : 0)
                .scaleEffect(isEditing ? CGSize(width: 0.9, height: 0.9) : CGSize(width: 1.0, height: 1.0))
            
        }
  
    }
}

#Preview {
    FloatingTextField(placeHolderText: "Email", value: "")
}
