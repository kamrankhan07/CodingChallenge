//
//  PostStorageManager.swift
//  CodingChallenge
//
//  Created by Kamran Khan on 21/7/22.
//

import Foundation

class PostStorageManager: ObservableObject {
    static let shared = PostStorageManager()
    @Published private var storage: [Post] = []
    
    init() {
        storage.append(Post(user: User(name: "John Alex", username: "john_alex"), text: "Sample post", timeStamp: Date()))
        storage.append(Post(user:  User(name: "David Lucas", username: "david_lucas9"), text: "Another sample post", timeStamp: Date()))
        /*let user = User(name: "John Alex", username: "john_alex")
        let post = Post(user: user, text: "Lorem ipsum dolor sit amet, an cetero mediocrem eam. Malorum repudiare id sit. Vim suas decore patrioque an, ut mel affert repudiandae. Vix ornatus vivendum ne, ut audire quaestio consulatu eam. No his porro exerci, id summo petentium accusamus usu. At tempor everti per. At his utinam adipisci. No detracto.", timeStamp: Date(), image: nil)
        var s = [Post](repeating: post, count: 10)
        
        let user2 = User(name: "David Lucas", username: "david_lucas9")
        let post2 = Post(user: user2, text: "Lorem ipsum dolor sit amet, an cetero mediocrem eam.", timeStamp: Date(), image: nil)
        
        var s2 = [Post](repeating: post2, count: 5)
        storage.append(contentsOf: s2)
        storage.append(contentsOf: s)*/
    }
    
    func addNewPost(post: Post) {
        storage.append(post)
    }
    
    func getAllPosts() -> [Post] {
        return storage
    }
    
    func getAllPostsForUser(_ user: User) -> [Post] {
        return getAllPosts().filter{ $0.user.username == user.username }
    }
    
}

