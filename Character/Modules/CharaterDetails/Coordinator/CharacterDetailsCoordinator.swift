//
//  CharacterDetailsCoordinator.swift
//  Character
//
//  Created by MhMuD SalAh on 24/08/2025.
//

import SwiftUI

final class CharacterDetailsCoordinator {
    
    func assemble(character: CharacterModel) -> some View {
        let viewModel = CharacterDetailsViewModel(character: character)
        return CharacterDetailsView(viewModel: viewModel)
    }
}
