//
//  CharacterDetailsView.swift
//  Character
//
//  Created by MhMuD SalAh on 24/08/2025.
//

import SwiftUI
import Kingfisher

struct CharacterDetailsView: View {
    
    @ObservedObject var viewModel: CharacterDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ZStack(alignment: .bottom) {
                    coverImage
                    profileImage
                }
                .padding(.bottom, 75)
                
                detailsView
                    .padding()
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle(viewModel.character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var coverImage: some View {
        KFImage(URL(string: viewModel.character.image ?? ""))
            .resizable()
            .scaledToFill()
            .frame(height: 400)
            .clipped()
            .overlay {
                Rectangle()
                    .fill(.black.opacity(0.3))
            }
    }
    
    private var profileImage: some View {
        CircleImage(image: viewModel.character.image ?? "")
            .frame(width: 150, height: 150)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
            .offset(y: 75)
    }
    
    private var detailsView: some View {
        VStack(alignment: .center, spacing: 8) {
            Text(viewModel.character.name)
                .font(.title)
            
            Divider()
            
            Text("About \(viewModel.character.name)")
                .font(.title2)
                .padding(.top)
            
            Text("Species: \(viewModel.character.species)")
                .font(.body)
            
            Text("Status: \(viewModel.character.status)")
                .font(.body)
        }
    }
}

#Preview {
    CharacterDetailsView(
        viewModel: CharacterDetailsViewModel(
            character: CharactersDataSource().characters.first!
        )
    )
}
