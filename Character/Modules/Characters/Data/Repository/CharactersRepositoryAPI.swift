//
//  CharactersRepositoryAPI.swift
//  Character
//
//  Created by MhMuD SalAh on 23/08/2025.
//

import Networking

struct CharactersRepositoryAPI: CharactersRepository {
    private let provider: URLSessionProviderProtocol
    
    init(provider: URLSessionProviderProtocol) {
        self.provider = provider
    }
    
    func getCharacters(pageURL: String? = nil) async -> Result<ResponseModel<[CharacterModel]>, APIError> {
        let service = CharacterService(pageURL: pageURL)
        return await provider.request(service: service)
    }
}
