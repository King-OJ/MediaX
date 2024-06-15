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
        
                Spacer()
                
                if let icon = icon {
                    Image(systemName: icon)
                }
                
            })
            .foregroundStyle(.white)
            .font(.title3)
            .fontWeight(.bold)
            .frame(height: 64)
            .padding(.horizontal)
            .background{
                Color("primary500")
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
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
        
                Spacer()
                
                if let icon = icon {
                    Image(systemName: icon)
                }
                
            })
            .foregroundStyle(.white)
            .font(.title3)
            .fontWeight(.bold)
            .frame(height: 64)
            .padding(.horizontal)
            .background{
                Color("primary500")
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
        }
       
        
    }
}

#Preview {
    CTAbutton(text: "Get Started", icon: "arrow.right", type: .actionBtn , action: {print("hello")})
}
