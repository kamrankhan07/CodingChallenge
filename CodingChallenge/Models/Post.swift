//
//  Post.swift
//  CodingChallenge
//
//  Created by Kamran Khan on 21/7/22.
//

import Foundation
import SwiftUI

struct Post: Identifiable {
    var id = UUID()
    var user: User
    var text: String
    var timeStamp: Date
    var image: UIImage?
}
