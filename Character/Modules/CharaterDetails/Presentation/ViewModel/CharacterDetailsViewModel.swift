//
//  CharacterDetailsViewModel.swift
//  Character
//
//  Created by MhMuD SalAh on 24/08/2025.
//

import Combine

final class CharacterDetailsViewModel: ObservableObject {
    
    // MARK: - Propreties
        
    @Published var character: CharacterModel
    
    // MARK: - Init
    
    init(character: CharacterModel) {
        self.character = character
    }
}

