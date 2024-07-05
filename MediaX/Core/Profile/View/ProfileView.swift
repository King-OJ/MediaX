//
//  ProfileView.swift
//  MediaX
//
//  Created by King OJ on 14/06/2024.
//

import SwiftUI
import Flow


struct ProfileView: View {
    
    let options: [profileOptions] = [.init(title: "My QR Code", icon: "square.and.at.rectangle"), .init(title: "Settings and Privacy", icon: "gear")]
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var showSettingsModals = false
    
    @Binding var currentTab: MainTab.Tabs
    
    @EnvironmentObject var baseViewModel : BaseViewModel
    
    var profileImgs = (2...6).map { count in
        Photo(name: "profile-img\(count)")
    }
    
    var user : User?
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        
            NavigationStack {
                ZStack(alignment: .bottom, content: {
                    ScrollView {
                            VStack(spacing: 20) {
                                //profile img and names
                                VStack {
                                    RoundedImgContainer(img: user?.profileImgUrl ?? "profile-img", padding: 6)
                                        .frame(width: 90, height: 90)
                                    
                                    Text("@\(user?.username ?? "your username")")
                                        .fontWeight(.semibold)
                                        .font(.callout)
                                    
                                }
                               
                                
                                //profile statistics
                                HStack(spacing: 20, content: {
                                    VStack {
                                        Text(String(user?.following ?? 10))
                                            .fontWeight(.bold)
                                        Text("Following")
                                            .font(.callout)
                                            .foregroundStyle(Color(.systemGray))
                                    }
                                    
                                    Divider()
                                        .frame(width: 1)
                                        .background(Color(.systemGray))
                                    
                                    VStack {
                                        Text(String(user?.followers ?? 10))
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
                                
                                //profile action buttons and bio
                                VStack(spacing: 10) {
                                    
                                    HStack {
                                        if let user = user, let loggedInUser = baseViewModel.user {
                                            
                                            if user.id == loggedInUser.id {
                                                Button(action: {
                                                    print("edit")
                                                }, label: {
                                                    Text("Edit")
                                                        .fontWeight(.bold)
                                                        .font(.headline)
                                                })
                                                .foregroundColor(.white)
                                                .padding(.vertical, 10)
                                                .padding(.horizontal, 15)
                                                .background(Color("primary500"))
                                                .cornerRadius(10)
                                            }
                                            
                                            else {
                                                Button(action: {
                                                    print("follow")
                                                }, label: {
                                                    Text("Follow")
                                                        .fontWeight(.bold)
                                                        .font(.headline)
                                                })
                                                .foregroundColor(.white)
                                                .padding(.vertical, 10)
                                                .padding(.horizontal, 15)
                                                .background(Color("primary500"))
                                                .cornerRadius(10)
                                                
                                                Button(action: {
                                                    print("message")
                                                }, label: {
                                                    Image(systemName: "message")
                                                })
                                                .padding(10)
                                                .background(Color("primary500"))
                                                .foregroundStyle(.white)
                                                .clipShape(Circle())
                                            }
                                                
                                                
                                            }
                                        
                                        }
                                    
                                    Text(user?.bio ?? "My Bio")
                                        .font(.caption)
                                        .multilineTextAlignment(.center)
                                    
                                }
                                
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
                    
                    if showSettingsModals {
                    ZStack(alignment:.bottom ,content: {
                        Color(.black)
                            .opacity(0.5)
                            .onTapGesture {
                                showSettingsModals.toggle()
                            }
                        
                        
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(Array(options.enumerated()), id: \.offset){
                                index, option in
                                VStack(alignment: .leading) {
                                    ProfileOptions(option: option)
                                    
                                    if index != options.count - 1{
                                        Divider()
                                    }
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.white)
                        .clipShape(.rect(topLeadingRadius: 10, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 10))
                        
                    })
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                        
                    }
                })
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        if let user = user, let loggedInUser = baseViewModel.user
                        {
                            if user.id == loggedInUser.id {
                                Button(action: {
                                    showSettingsModals.toggle()
                                }, label: {
                                    Image(systemName: "line.3.horizontal")
                                        .fontWeight(.semibold)
                                        .font(.headline)
                                })
                                .foregroundStyle(.black)
                                
                            }
                            else {
                                Button(action: {
                                    showSettingsModals.toggle()
                                }, label: {
                                    Image(systemName: "arrowshape.turn.up.right")
                                        .fontWeight(.semibold)
                                        .font(.headline)
                                })
                                .foregroundStyle(.black)
                                
                            }
                        }
                        
                        
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text(user?.fullname ?? "Your name" )
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                    }
                    
                    if currentTab != .profile {
                        ToolbarItem(placement: .topBarLeading) {
                            Button(action: {
                                dismiss();
                            }, label: {
                               Image(systemName: "chevron.left")
                                    .fontWeight(.semibold)
                                
                            }).foregroundStyle(.black)
                           
                                
                        }
                    }
                    
                })
                .toolbar(showSettingsModals ? .hidden : .visible, for: .tabBar)
                
                
                
                
            }
            
       
       
        
      
    }
}

#Preview {
    ProfileView(currentTab: MainTab().$selectedTab, user: BaseViewModel().user)
        .environmentObject(BaseViewModel())
   
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

struct profileOptions: Hashable {
    var title: String
    var icon: String
}
