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
    private var nextPageURL: String? = nil
    
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
    
    func loadMore(currentItem: CharacterModel) {
        guard let lastItem = characters.last else { return }
        if currentItem.id == lastItem.id, nextPageURL != nil {
            getCharacters()
        }
    }
    
    private func getCharacters() {
        Task {
            let result = await useCase.getCharacters(pageURL: nextPageURL)
            await MainActor.run {
                switch result {
                case let .success((characters, nextPage)):
                    self.characters.append(contentsOf: characters)
                    self.nextPageURL = nextPage
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
