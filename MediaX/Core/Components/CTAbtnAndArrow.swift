//
//  CTAbtnAndArrow.swift
//  MediaX
//
//  Created by King OJ on 13/06/2024.
//

import SwiftUI

enum BtnType {
    case navBtn
    case actionBtn
}

struct CTAbutton: View {
    
    var text: String?
    var icon: String?
    var type: BtnType
    var action: (()->Void)?
    
    var body: some View {
        if type == .actionBtn {
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
            .foregroundStyle(.white)
            .font(.title3)
            .fontWeight(.bold)
            .frame(height: 54)
            .padding(.horizontal)
            .onTapGesture(perform: {
                guard let action = action else { return }

                action()
            })
        }
        else {
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
            .foregroundStyle(.white)
            .font(.title3)
            .fontWeight(.bold)
            .frame(height: 54)
            
        }
       
        
    }
}

#Preview {
    CTAbutton(text: "Get Started", icon: "arrow.right", type: .navBtn , action: {print("hello")})
}
