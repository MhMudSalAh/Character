//
//  CharactersView.swift
//  Character
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var viewModel: CharactersViewModel
    
    var body: some View {
        List(viewModel.filteredCharacters) { character in
            CharacterView(viewModel: CharacterViewModel(character))
                .listRowSeparator(.hidden)
                .onTapGesture {
                    viewModel.didSelectCharacter(character)
                }
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
            viewModel.viewDidLoad()
        }
        .onChange(of: viewModel.searchQuery) { query in
            viewModel.searchQuery = query
        }
    }
}

#Preview {
    CharactersCoordinator(path: .constant(NavigationPath())).start(isPreview: true)
}
