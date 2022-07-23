//
//  User.swift
//  CodingChallenge
//
//  Created by Kamran Khan on 20/7/22.
//

import Foundation
import SwiftUI

struct User: Hashable, Equatable {
    var name: String
    var username: String
   
    func hash(into hasher: inout Hasher) {
        hasher.combine(username)
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.username == rhs.username
    }
}
