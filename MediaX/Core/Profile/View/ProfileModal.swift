//
//  ProfileModal.swift
//  MediaX
//
//  Created by King OJ on 02/07/2024.
//

import SwiftUI

struct ProfileModal: View {
    
    let options: [profileOptions] = [.init(title: "My QR Code", icon: "square.and.at.rectangle"), .init(title: "Settings and Privacy", icon: "gear")]
    
    var body: some View {
        NavigationStack{
            List(options, id: \.self) { option in
                
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
                .alignmentGuide(.listRowSeparatorLeading) { d in
                    0
                }
            }
            .listStyle(.plain)
            .listRowSpacing(12)
            .padding(.vertical)
        }
    }
}

struct profileOptions: Hashable {
    var title: String
    var icon: String
}

#Preview {
    ProfileModal()
}
