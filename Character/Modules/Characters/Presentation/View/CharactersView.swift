//
//  CharactersView.swift
//  Character
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import SwiftUI

struct CharactersView: View {
    
    @StateObject private var viewModel: CharactersViewModel
    
    init(viewModel: CharactersViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        List(viewModel.filteredCharacters) { character in
            characterView(for: character)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Characters")
        .searchable(
            text: $viewModel.searchQuery,
            prompt: "Search Characters by Name"
        ) {
            ForEach(viewModel.filteredCharacters) { character in
                Text(character.name)
                    .searchCompletion(character.name)
            }
        }
        .onViewDidLoad {
            await viewModel.viewDidLoad()
        }
        .onChange(of: viewModel.searchQuery) { query in
            viewModel.searchQuery = query
        }
    }
    
    private func characterView(for character: CharacterModel) -> some View {
        CharacterView(viewModel: CharacterViewModel(character))
            .listRowSeparator(.hidden)
            .onTapGesture {
                viewModel.didSelectCharacter(character)
            }
            .task {
                await viewModel.loadMore(currentItem: character)
            }
    }
}

#Preview {
    CharactersCoordinator(path: .constant(NavigationPath())).start(isPreview: true)
}
