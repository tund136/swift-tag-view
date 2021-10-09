//
//  Tag.swift
//  TagView
//
//  Created by Danh Tu on 09/10/2021.
//

import Foundation
import SwiftUI

// Tag Model
struct Tag: Identifiable, Hashable {
    var id = UUID().uuidString
    var text: String
    var size: CGFloat = 0
}
