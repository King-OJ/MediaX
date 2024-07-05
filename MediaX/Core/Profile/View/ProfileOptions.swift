//
//  ProfileOptions.swift
//  MediaX
//
//  Created by King OJ on 02/07/2024.
//

import SwiftUI

struct ProfileOptions: View {
    
    var option: profileOptions
    
    
    var body: some View {
                
                NavigationLink {
                    SettingsAndPrivacyView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Label(
                        title: { Text(option.title).fontWeight(.semibold) },
                        icon: { Image(systemName: option.icon)
                                .foregroundStyle(.black)
                        }
                    )
                    
                }
                .foregroundStyle(.black)
                .padding(.vertical, 6)
//                .alignmentGuide(.listRowSeparatorLeading) { d in
//                    0
//                }
            
        

        
    }
}



#Preview {
    ProfileOptions(option: .init(title: "Settings and Privacy", icon: "gear"))
}
