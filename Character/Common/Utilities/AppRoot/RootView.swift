//
//  RootView.swift
//  Character
//
//  Created by MhMuD SalAh on 07/10/2025.
//

import SwiftUI

struct RootView: View {
    @StateObject var coordinator: CharactersCoordinator

    var body: some View {
        coordinator.start()
    }
}
