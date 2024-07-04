//
//  CTAbtnAndArrow.swift
//  MediaX
//
//  Created by King OJ on 13/06/2024.
//

import SwiftUI

struct CTAbutton: View {
    
    var text: String?
    var icon: String?
    
    var body: some View {
       
            HStack(content: {
                
                if let text = text {
                    Text(text)
                }
        
                
                
                if let icon = icon {
                    HStack {
                        Spacer()
                        Image(systemName: icon)
                    }
                }
                
            })
            .padding(.horizontal)
            .foregroundStyle(.white)
            .font(.title3)
            .fontWeight(.bold)
            .frame(height: 48)
            
        }
       
        
    
}

#Preview {
    CTAbutton(text: "Get Started", icon: "arrow.right")
}
