//
//  MyPosts.swift
//  CodingChallenge
//
//  Created by Kamran Khan on 23/7/22.
//

import SwiftUI

struct MyPosts: View {
    @ObservedObject var userManager = UserManager.shared
    @ObservedObject var postStorage = PostStorageManager.shared
    
    var body: some View {
        List(postStorage.getAllPostsForUser(userManager.selectedUser)) {
            PostRow(post: $0)
                .listRowInsets(EdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12))
        }
        .listStyle(PlainListStyle())
    }
}

//struct MyPosts_Previews: PreviewProvider {
//    static var previws: some View {
//        MyPosts()
//    }
//}
