//
//  Backpack.swift
//  ExpandingLists
//
//  Created by Jungman Bae on 4/25/24.
//

import Foundation

struct Backpack: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var content: [Backpack]?
}


