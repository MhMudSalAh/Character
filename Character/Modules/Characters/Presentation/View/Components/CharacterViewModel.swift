//
//  CharacterViewModel.swift
//  Character
//
//  Created by MhMuD SalAh on 23/08/2025.
//

import Combine

final class CharacterViewModel: ObservableObject {
    @Published private(set) var character: CharacterModel
    
    init(_ character: CharacterModel) {
        self.character = character
    }
}
