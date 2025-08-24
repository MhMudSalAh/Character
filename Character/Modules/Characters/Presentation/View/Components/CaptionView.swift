//
//  CaptionView.swift
//  Character
//
//  Created by MhMuD SalAh on 23/08/2025.
//

import SwiftUI

struct Caption: View {
    let text: String
    let textWeight: Font.Weight
    
    var body: some View {
        Text(text)
            .fontWeight(textWeight)
            .padding(5)
            .background(
                .white.opacity(0.75),
                in: RoundedRectangle(cornerRadius: 10.0, style: .continuous)
            )
            .padding(5)
    }
}

#Preview {
    Caption(
        text: CharactersDataSource().characters.first!.name,
        textWeight: .semibold
    )
}
