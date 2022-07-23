//
//  ColorExtension.swift
//  CodingChallenge
//
//  Created by Kamran Khan on 22/7/22.
//

import Foundation
import SwiftUI

extension Color {
    static let background = Color("background")
    static let icon = Color("icon")
    static let text = Color("text")
    static let tabSelection = Color("tab_selection")
    static let addNewPost = Color("add_new_post")
    static let borderColor = Color("border_color")
    
    static func random() -> Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}
