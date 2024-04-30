//
//  Comment.swift
//  FirebaseBasic
//
//  Created by Jungman Bae on 4/30/24.
//

import Foundation

struct Comment: Identifiable, Codable, Hashable {
    var id: String = UUID().uuidString
    let date: Date
    let body: String
    let author: String?
    let username: String?
    let photoURL: URL?
    var docId: String?
    
    enum CodingKeys: String, CodingKey {
        case date
        case body
        case author
        case username
        case photoURL
        case docId
    }
}
