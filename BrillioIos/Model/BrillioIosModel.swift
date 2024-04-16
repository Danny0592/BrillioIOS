//
//  BrillioIosModel.swift
//  BrillioIos
//
//  Created by daniel ortiz millan on 16/04/24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let titles = try? JSONDecoder().decode(Titles.self, from: jsonData)

import Foundation

// MARK: - Titles
struct Titles: Codable {
    let id, content, author: String
    let tags: [String]
    let authorSlug: String
    let length: Int
    let dateAdded, dateModified: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case content, author, tags, authorSlug, length, dateAdded, dateModified
    }
}
