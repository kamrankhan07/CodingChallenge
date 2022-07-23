//
//  UserManager.swift
//  CodingChallenge
//
//  Created by Kamran Khan on 20/7/22.
//

import Foundation
import SwiftUI

class UserManager: ObservableObject {
    
    static let shared = UserManager()
    @Published var users: [User] = []
    @Published var selectedUser: User! {
        didSet {
            print("User Changed: \(selectedUser.name)")
        }
    }
    
    init() {
        populateDummyUsers()
        selectedUser = users.first
    }
    
    private func populateDummyUsers() {
        users.append(User(name: "John Alex", username: "john_alex"))
        users.append(User(name: "Emma Oliver", username: "emma_o3"))
        users.append(User(name: "David Lucas", username: "david_lucas9"))
    }
}
