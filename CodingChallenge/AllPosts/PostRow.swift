//
//  PostRow.swift
//  CodingChallenge
//
//  Created by Kamran Khan on 23/7/22.
//

import SwiftUI

struct PostRow: View {
    var post: Post

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .orange)
                .frame(width: 50, height: 50)
                //.clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 13) {
                HStack(spacing: 10) {
                    Text("\(post.user.name)")
                        .foregroundColor(Color.text)
                        .font(.system(size: 17, weight: .bold))
                    Text("@\(post.user.username)")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 17, weight: .medium))
                }
                
                Text("\(post.text)")
                    .foregroundColor(Color.text)
                    .font(.system(size: 18))
                
                if let image = post.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .padding(.top, 1)
        }
        .padding([.top, .bottom], 10)
        .listRowBackground(Color.clear)
    }
}

struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostRow(post: postPreviewData)
            PostRow(post: postPreviewData)
                .preferredColorScheme(.dark)
        }
    }
}
