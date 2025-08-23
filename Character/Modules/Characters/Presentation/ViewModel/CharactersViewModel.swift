//
//  CharactersViewModel.swift
//  Character
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import Combine

final class CharactersViewModel: ObservableObject {
    
    // MARK: - Propreties
    
    private let useCase: CharactersUseCase
    private let router: CharactersRouter
    
    @Published var characters: [CharacterModel] = []
    @Published var filteredCharacters: [CharacterModel] = []
    @Published var searchQuery: String = ""
    
    // MARK: - Init
    
    init(
        useCase: CharactersUseCase,
        router: CharactersRouter
    ) {
        self.useCase = useCase
        self.router = router
    }
    
    // MARK: - Implementation
    
    func viewDidLoad() {
        getCharacters()
        setupBindings()
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
    
    func setupBindings() {
        $searchQuery
            .combineLatest($characters)
            .map { (searchQuery, characters) in
                characters.filter {
                    searchQuery.isEmpty ? true : $0.name
                        .localizedCaseInsensitiveContains(searchQuery)
                }
            }
            .assign(to: &$filteredCharacters)
    }
    
    func didSelectCharacter(_ character: CharacterModel) {
        router.navigateToCharacterDetails(character: character)
    }
}
