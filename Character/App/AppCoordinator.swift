//
//  AppCoordinator.swift
//  Character
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import SwiftUI

final class AppCoordinator: ObservableObject, Coordinator {
    @Published var path = NavigationPath()
    @Published var destinations: [AppDestination] = []
    
    func start(isPreview: Bool = false) -> some View {
        let coordinator = CharactersCoordinator(path: self.pathBinding)
        return NavigationStack(path: pathBinding) {
            RootView(coordinator: coordinator)
        }
    }
}

enum AppDestination: Hashable, Identifiable {
    case characters
    var id: Self { self }
}
