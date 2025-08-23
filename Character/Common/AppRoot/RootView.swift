//
//  RootView.swift
//  Character
//
//  Created by MhMuD SalAh on 23/08/2025.
//

import SwiftUI


struct RootView: View {
    @StateObject var coordinator: CharactersCoordinator

    var body: some View {
        coordinator.start()
            .environmentObject(coordinator)
    }
}
