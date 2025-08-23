//
//  CharacterModel.swift
//  Character
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import Foundation

struct CharacterModel: Identifiable, Hashable {
    let id: Int
    let name: String
    let species: String
    let status: String
    let image: String?
}

extension CharacterModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case species
        case status
        case image
    }
}
