//
//  CharactersUseCase.swift
//  Character
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import Foundation
import Networking

public struct CharactersUseCase {
    private let repository: CharactersRepository
    
    init(repository: CharactersRepository) {
        self.repository = repository
    }
    
    func getCharacters() async -> Result<[CharacterModel], APIError> {
        let result = await repository.getCharacters()
        switch result {
        case .success(let response):
            return .success(response.data)
        case .failure(let error):
            return .failure(error)
        }
    }
}
