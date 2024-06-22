//
//  PhotoGalleryView.swift
//  MediaX
//
//  Created by King OJ on 21/06/2024.
//

import SwiftUI

struct Photo: Identifiable {
    var id = UUID()
    var name: String
}

let samplePhotos = (1...5).map {count in
    Photo(name: "post-img\(count)")
}

struct PhotoGalleryView: View {
    
    @State var gridLayout: [GridItem] = [GridItem()]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {

                    ForEach(samplePhotos.indices, id: \.self) { index in

                        Image(samplePhotos[index].name)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 200)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)

                    }
                }
                .padding(.all, 10)
            }
            .navigationTitle("Photo Grid")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        self.gridLayout = Array(repeating: .init(.flexible()), count: self.gridLayout.count % 4 + 1)
                    }, label: {
                        Image(systemName: "square.grid.2x2")
                                        .font(.title)
                    }).tint(.primary)
                }
            }
        }
    }
}

#Preview {
    PhotoGalleryView()
}
