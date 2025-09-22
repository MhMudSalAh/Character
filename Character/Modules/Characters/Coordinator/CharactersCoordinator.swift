//
//  CharactersCoordinator.swift
//  Character
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import SwiftUI
import Networking

// MARK: - CharactersCoordinator

final class CharactersCoordinator: Router, ObservableObject {
    @Binding var path: NavigationPath
    @Published var destinations: [CharactersDestination] = []
    
    // MARK: - Full Screen
    @Published var sheet: CharactersDestination? = nil
    // MARK: - Sheet
    @Published var fullScreen: CharactersDestination? = nil
    
    init(path: Binding<NavigationPath>) {
        self._path = path
    }
    
    @ViewBuilder
    func start(isPreview: Bool = false) -> some View {
        let coordinator = self
        
        assemble(isPreview)
        // MARK: - Navigate
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .characterDetails(let character):
                    CharacterDetailsCoordinator().assemble(character: character)
                }
            }
        // MARK: - Full Screen
            .fullScreenCover(item: Binding(get: { self.fullScreen }, set: { self.fullScreen = $0 })) { destination in
                switch destination {
                case .characterDetails(let character):
                    CharacterDetailsCoordinator().assemble(character: character)
                }
            }
        // MARK: - Sheet Screen
            .sheet(item: Binding(
                get: { coordinator.sheet },
                set: { coordinator.sheet = $0 }
            )) { sheetDestination in
                switch sheetDestination {
                case .characterDetails(let character):
                    CharacterDetailsCoordinator().assemble(character: character)
                        .presentationDetents([.medium, .large])
                }
            }
    }
    
    private func assemble(_ isPreview: Bool) -> some View {
        let provider = URLSessionProvider()
        let repository = CharactersRepositoryAPI(provider: provider)
        let mockRepository = CharactersRepositoryMock()
        let useCase = CharactersUseCase(repository: isPreview ? mockRepository : repository)
        
        return CharactersView {
            CharactersViewModel(useCase: useCase, router: self)
        }
    }
    
    // MARK: - Full Screen
    
    func presentFullScreen(_ destination: FullDestination) {
        fullScreen = destination
    }
    
    func dismissFullScreen() {
        fullScreen = nil
    }
    
    // MARK: - Sheet
    
    func presentSheet(_ sheet: SheetDestination) {
        self.sheet = sheet
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
}

// MARK: - Characters Router

extension CharactersCoordinator: CharactersRouter {
    func navigateToCharacterDetails(character: CharacterModel) {
        push(.characterDetails(character))
        //        presentSheet(.characterDetails(character))
        //        presentFullScreen(.characterDetails(character))
    }
}
