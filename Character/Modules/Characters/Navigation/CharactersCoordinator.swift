//
//  CharactersCoordinator.swift
//  Character
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import SwiftUI
import Networking

final class CharactersCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    var pathBinding: Binding<NavigationPath> {
        Binding(
            get: { self.path },
            set: { self.path = $0 }
        )
    }
    
    func start(isPreview: Bool = false) -> some View {
        NavigationStack(path: pathBinding) {
            assembleModule(isPreview)
            .navigationDestination(for: CharactersDestination.self) { destination in
                // TODO: -
            }
        }
    }
    
    private func assembleModule(_ isPreview: Bool) -> some View {
        let provider = URLSessionProvider()
        let repository = CharactersRepositoryAPI(provider: provider)
        let mockRepository = CharactersRepositoryMock()
        let useCase = CharactersUseCase(repository: isPreview ? mockRepository : repository)
        let viewModel = CharactersViewModel(
            useCase: useCase,
            router: self
        )

        return CharactersView(viewModel: viewModel)
    }
}

extension CharactersCoordinator: CharactersCoordinatorInterface {
    func navigateToCharacterDetails(character: CharacterModel) {
        path.append(CharactersDestination.characterDetails(character: character))
    }
}
