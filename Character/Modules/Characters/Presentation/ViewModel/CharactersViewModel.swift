//
//  CharactersViewModel.swift
//  Character
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import Foundation

final class CharactersViewModel: ObservableObject {
    private let useCase: CharactersUseCase
    private let router: CharactersRouter
    
    @Published var characters = [CharacterModel]()
    
    init(
        useCase: CharactersUseCase,
        router: CharactersRouter
    ) {
        self.useCase = useCase
        self.router = router
        getCharacters()
    }
    
    private func getCharacters() {
        Task {
            let result = await useCase.getCharacters()
            await MainActor.run {
                switch result {
                case .success(let characters):
                    self.characters = characters
                case .failure(_):
                    break
                }
            }
        }
    }
    
    func didSelectCharacter(_ character: CharacterModel) {
        router.navigateToCharacterDetails(character: character)
    }
}
