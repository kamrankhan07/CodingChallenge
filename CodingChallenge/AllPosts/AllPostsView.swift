//
//  AllPostsView.swift
//  CodingChallenge
//
//  Created by Kamran Khan on 21/7/22.
//

import SwiftUI

struct AllPostsView: View {
    @ObservedObject var postStorage = PostStorageManager.shared
    
    var body: some View {
        List(postStorage.getAllPosts()) {
            PostRow(post: $0)
                .listRowInsets(EdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12))
        }
        .listStyle(PlainListStyle())
    }
}

//struct AllPostsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllPostsView()
//    }
//}
