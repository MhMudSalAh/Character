//
//  CharactersDestination.swift
//  Character
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import Foundation

enum CharactersDestination: Identifiable, Hashable {
    case characterDetails(_ character: CharacterModel)
    
    var id: Int {
        switch self {
        case .characterDetails(let character):
            return character.id
        }
    }
}
