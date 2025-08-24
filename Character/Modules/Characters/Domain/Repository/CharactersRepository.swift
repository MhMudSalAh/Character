//
//  CharactersRepository.swift
//  Character
//
//  Created by MhMuD SalAh on 23/08/2025.
//

import Networking

protocol CharactersRepository {
    func getCharacters(pageURL: String?) async -> Result<ResponseModel<[CharacterModel]>, APIError>
}
