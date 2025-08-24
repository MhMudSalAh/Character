//
//  CircleImage.swift
//  Character
//
//  Created by MhMuD SalAh on 24/08/2025.
//

import SwiftUI
import Kingfisher

struct CircleImage: View {
    var image: String
    
    var body: some View {
        KFImage(URL(string: image))
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: CharactersDataSource().characters.first!.image!)
}
