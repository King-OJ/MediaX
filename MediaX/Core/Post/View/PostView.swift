//
//  PostView.swift
//  MediaX
//
//  Created by King OJ on 15/06/2024.
//

import SwiftUI

struct PostView: View {
    var post: Post
    
    var body: some View {
        VStack {
            //post title
            HStack {
                HStack {
                    RoundedImgContainer(img: post.postedBy.profileImgUrl)
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(post.postedBy.fullname)
                            .font(.subheadline)
                        
                        Text(post.postedBy.occupation)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .fontWeight(.bold)
            }
            
            //post content
            VStack(alignment: .leading ,spacing: 10, content: {
                
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(maxHeight: 380)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                //like, comment or share buttons and like info
                VStack(alignment:.leading, spacing:6 ) {
                    HStack(spacing:16 ,content: {
                        HStack(spacing: 3) {
                            Image(systemName: "heart")
                                .foregroundStyle(Color("redish"))
                                .imageScale(.small)
                            Text("Like")
                                .font(.footnote)
                        }
                        HStack(spacing: 3) {
                            Image(systemName: "ellipsis.message")
                                .imageScale(.small)
                            Text("Comment")
                                .font(.footnote)
                        }
                        
                        Spacer()
                        
                        HStack(alignment: .bottom ,spacing: 3) {
                            Image(systemName: "square.and.arrow.up")
                                .imageScale(.small)
                            Text("Share")
                                .font(.footnote)
                        }
                    })
                    
                    Text("Liked by you and 500 others")
                        .font(.caption)
                        .fontWeight(.bold)
                }
                
                Text(post.title)
                    .font(.subheadline)
                    
            })
            
            //post details
            
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    PostView(post: MockData().posts[0])
}
