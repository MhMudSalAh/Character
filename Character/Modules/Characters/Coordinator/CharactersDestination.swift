//
//  CharactersDestination.swift
//  Character
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import Foundation

enum CharactersDestination: Identifiable, Hashable {
    case characterDetails(_ character: CharacterModel)
    
    var id: String { String(describing: self) }
}
