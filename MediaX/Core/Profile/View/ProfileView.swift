//
//  ProfileView.swift
//  MediaX
//
//  Created by King OJ on 14/06/2024.
//

import SwiftUI
import Flow


struct ProfileView: View {
    @State var gridLayout: [GridItem] = [GridItem(), GridItem()]
  
    var profileImgs = (2...6).map { count in
        Photo(name: "profile-img\(count)")
    }
    
    var body: some View {
        
        ScrollView {
            VStack {
                VStack(spacing: 20) {
                    //profile img and names
                    HStack(spacing: 10) {
                        RoundedImgContainer(img: "profile-img")
                            .frame(width: 90, height: 90)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Clement Ojigs")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Text("@Fashion Designer")
                                .font(.subheadline)
                                .foregroundStyle(Color(.systemGray))
                                .fontWeight(.semibold)
                            
                            Button(action: {}, label: {
                                Text("Edit")
                                    .fontWeight(.bold)
                                    .font(.headline)
                            })
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 18)
                            .background(Color("primary500"))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                        
                        Spacer()
                    }
                    
                    //profile statistics
                    HStack(spacing: 20, content: {
                        VStack {
                            Text("256")
                                .fontWeight(.bold)
                            Text("Following")
                                .font(.callout)
                                .foregroundStyle(Color(.systemGray))
                        }
                        
                        Divider()
                            .frame(width: 1)
                            .background(Color(.systemGray))
                        
                        VStack {
                            Text("45K")
                                .fontWeight(.bold)
                            Text("Followers")
                                .font(.callout)
                                .foregroundStyle(Color(.systemGray))
                        }
                        
                        Divider()
                            .frame(width: 1)
                            .background(Color(.systemGray))
                        
                        VStack {
                            Text("100")
                                .fontWeight(.bold)
                            Text("Posts")
                                .font(.callout)
                                .foregroundStyle(Color(.systemGray))
                        }
                    })
                    
                    //profile small images
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(content: {
                            ForEach(profileImgs.indices, id: \.self) { index in
                                RoundedImg(imgUrl: profileImgs[index].name)
                            }
                        })
                    }
                    
                    //image grid button
                    HStack(content: {
                        Spacer()
                        
                        Button(action: {
                            self.gridLayout = Array(repeating: .init(.flexible()), count: self.gridLayout.count % 4 + 2)
                        }, label: {
                            Image(systemName: "square.grid.2x2")
                                            .font(.title2)
                        }).tint(.primary)
                    })
                    
                    LazyVGrid(columns: gridLayout,
                              spacing: 10,
                              content: {
                                Image("post-img1")
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth:0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 10 ))
                            
                            Image("post-img2")
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth:0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 10 ))
                        
                        Image("post-img3")
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth:0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 10 ))

                        Image("post-img4")
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth:0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 10 ))

                    })
          
                }
                
                
            }
            .padding()
        }
    }
}

#Preview {
    ProfileView()
}

struct RoundedImg: View {
    var imgUrl: String
    
    var body: some View {
        Image(imgUrl)
            .resizable()
            .scaledToFill()
            .frame(width: 64, height: 64)
            .clipShape(Circle())
            
    }
}
