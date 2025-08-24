//
//  CharacterView.swift
//  Character
//
//  Created by MhMuD SalAh on 23/08/2025.
//

import SwiftUI
import Kingfisher

struct CharacterView: View {
    @ObservedObject private(set) var viewModel: CharacterViewModel
    
    @State private var isAnimating = true
    
    var body: some View {
        KFImage(URL(string: viewModel.character.image ?? ""))
            .fade(duration: 0.3)
            .onSuccess { _ in
                isAnimating = false
            }
            .resizable()
            .scaledToFill()
            .frame(height: 350, alignment: .top)
            .overlay(alignment: .bottom) {
                HStack(spacing: 5) {
                    Caption(
                        text: viewModel.character.name,
                        textWeight: .bold
                    )
                    Caption(
                        text: viewModel.character.species,
                        textWeight: .medium
                    )
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding(.trailing, 12)
                .padding(.leading, 8)
                .padding(.vertical, 5)
                .background(Color.black.opacity(0.3))
            }
            .overlay(alignment: .center) {
                ProgressView()
                    .isHidden(!isAnimating)
            }
            .clipShape(RoundedRectangle(cornerRadius: 14))
    }
    
}

#Preview {
    CharacterView(
        viewModel: CharacterViewModel(
            CharactersDataSource().characters.first!
        )
    )
}
