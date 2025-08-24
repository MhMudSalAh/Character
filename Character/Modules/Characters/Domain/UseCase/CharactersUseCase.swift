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
    
    func getCharacters(pageURL: String? = nil)
    async -> Result<([CharacterModel], String?), APIError> {
        let result = await repository.getCharacters(pageURL: pageURL)
        switch result {
        case .success(let response):
            return .success((response.data, response.page?.next))
        case .failure(let error):
            return .failure(error)
        }
    }
}
