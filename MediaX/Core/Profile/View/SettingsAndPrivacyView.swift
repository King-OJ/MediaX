//
//  SettingsAndPrivacyView.swift
//  MediaX
//
//  Created by King OJ on 27/06/2024.
//

import SwiftUI

struct SettingsAndPrivacyView: View {
    
    @EnvironmentObject var baseViewModel: BaseViewModel
    @Environment(\.dismiss) var dismiss
    
    private var settings: [Setting] = [
        .init(sectionTitle: "Account", sections: [.init(title: "Account", icon: "person.fill"),.init(title: "Privacy", icon: "lock.fill"), .init(title: "Share profile", icon: "arrowshape.turn.up.right.fill")]),
        .init(sectionTitle: "Login", sections: [
            .init(title: "Switch Account", icon: "arrow.triangle.2.circlepath.circle.fill"),
            .init(title: "Log out", icon: "rectangle.portrait.and.arrow.right")
        ])
    ]
    
    var body: some View {
        NavigationStack {
            List(settings, id: \.self){
                setting in
                Section(setting.sectionTitle) {
                    ForEach(setting.sections) { section in
                       
                        NavigationLink {
                            //
                        } label: {
                            HStack(spacing: 10,content: {
                                Image(systemName: section.icon)
                                    .foregroundStyle(Color(.systemGray))
                                Text(section.title)
                                    .fontWeight(.semibold)
                            })
                           
                        }
                        
                        

                    }
                    
                    
                }
                .listRowSeparator(.hidden)
                    
                       
                    
                 
                }
            .navigationTitle("Settings and Privacy")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss();
                    }, label: {
                       Image(systemName: "chevron.left")
                            .fontWeight(.bold)
                        
                    }).foregroundStyle(.black)
                   
                        
                }
            }
        }
    }
}

struct Setting: Identifiable, Hashable {
    var id = UUID()
    var sectionTitle: String
    var sections: [SectionOptions]
    
    struct SectionOptions: Identifiable, Hashable {
        var id = UUID()
        var title: String
        var icon: String
    }
}



#Preview {
    SettingsAndPrivacyView()
}
