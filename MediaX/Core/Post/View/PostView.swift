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
        VStack(spacing: 10) {
            //post title
            HStack {
                HStack {
                    RoundedImgContainer(img: post.postedBy.profileImgUrl)
                        .frame(width: 40, height: 40)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(post.postedBy.fullname)
                            .font(.subheadline)
                        
                        Text(post.postedBy.occupation)
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                            .fontWeight(.semibold)
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
                        .fontWeight(.semibold)
                }
                .padding(.horizontal, 6)
                
                Text(post.title)
                    .font(.caption)
                    .padding(.horizontal, 6)
                    
            })
            
            
        }
        .padding(.vertical)
        .padding(.horizontal,6)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    PostView(post: MockData().posts[0])
}
