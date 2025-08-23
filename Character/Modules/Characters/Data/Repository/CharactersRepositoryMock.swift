//
//  CharactersRepositoryMock.swift
//  Character
//
//  Created by MhMuD SalAh on 23/08/2025.
//

import Networking

struct CharactersRepositoryMock: CharactersRepository {
    private let dataSource = CharactersDataSource()
    
    func getCharacters() async -> Result<ResponseModel<[CharacterModel]>, APIError> {
        do {
            let characters = try await dataSource.getCharacters()
            return .success(
                ResponseModel(
                    page: nil,
                    data: characters
                )
            )
        } catch {
            return .failure(APIError(type: .noResponse))
        }
    }
}
