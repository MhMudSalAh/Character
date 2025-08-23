//
//  CharactersDataSource.swift
//  Character
//
//  Created by MhMuD SalAh on 23/08/2025.
//

import Foundation

final class CharactersDataSource {
    
    var characters: [CharacterModel] {
        [
            CharacterModel(
                id:  1,
                name: "Rick Sanchez",
                species: "Human",
                status: "Alive",
                image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
            ),
            CharacterModel(
                id: 2,
                name: "Morty Smith",
                species: "Human",
                status: "Alive",
                image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"
            )
        ]
    }
    
    func getCharacters() async throws -> [CharacterModel] {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return characters
    }
}
