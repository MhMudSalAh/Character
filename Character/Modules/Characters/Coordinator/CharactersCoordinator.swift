//
//  CharactersCoordinator.swift
//  Character
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import SwiftUI
import Networking

// MARK: - CharactersCoordinator

final class CharactersCoordinator: Router, CharactersRouter {
    typealias Destination = CharactersDestination
    @Binding var path: NavigationPath
    @Published var destinations: [Destination] = []
    
    init(path: Binding<NavigationPath>) {
        self._path = path
    }
    
    @ViewBuilder
    func start(isPreview: Bool = false) -> some View {
        assemble(isPreview)
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .characterDetails(let character):
                    CharacterDetailsCoordinator().assemble(character: character)
                }
            }
    }
    
    private func assemble(_ isPreview: Bool) -> some View {
        let provider = URLSessionProvider()
        let repository = CharactersRepositoryAPI(provider: provider)
        let mockRepository = CharactersRepositoryMock()
        let useCase = CharactersUseCase(repository: isPreview ? mockRepository : repository)
        
        let viewModel = CharactersViewModel(useCase: useCase, router: self)
        return CharactersView(viewModel: viewModel)
    }
    
    func navigateToCharacterDetails(character: CharacterModel) {
        push(.characterDetails(character))
    }

}
