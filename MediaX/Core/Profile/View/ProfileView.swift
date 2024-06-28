//
//  ProfileView.swift
//  MediaX
//
//  Created by King OJ on 14/06/2024.
//

import SwiftUI
import Flow


struct ProfileView: View {
    @State private var gridLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var showSettingsModals = false
    
    var profileImgs = (2...6).map { count in
        Photo(name: "profile-img\(count)")
    }
    
    var body: some View {
        
       
        NavigationStack {
            ScrollView {
                    VStack(spacing: 20) {
                        //profile img and names
                        HStack(spacing: 10) {
                            RoundedImgContainer(img: "profile-img", padding: 6)
                                .frame(width: 90, height: 90)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Clement Ojigs")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                
                                Text("@Fashion Designer")
                                    .font(.subheadline)
                                    .foregroundStyle(Color(.systemGray))
                                    .fontWeight(.semibold)
                                
                                Button(action: {
                                    print("edit")
                                }, label: {
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
                        HStack(spacing: 30, content: {
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
                                            .frame(width: 54, height: 54)
                                    }
                                })
                                .frame( width: 350, alignment: .center)
                                
                            }.frame(width: 350)
              
                        //image grid buttons
                        HStack(content: {
                            Spacer()
                            
                            Button(action: {
                                self.gridLayout = Array(repeating: .init(.flexible()), count:{                    if self.gridLayout.count == 4 {
                                    return 2;
                                }  else {
                                    return self.gridLayout.count % 4 + 1
                                }
                                }()
                                )
                                
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
                    .padding(.horizontal)
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showSettingsModals.toggle()
                    }, label: {
                        Image(systemName: "gear")
                    })
                    .foregroundStyle(.black)
                    .fullScreenCover(isPresented: $showSettingsModals) {
                               SettingsModal()
                            }
                    
                }
            })
            
            
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
            .clipShape(Circle())
            
    }
}
