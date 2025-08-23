//
//  AppCoordinator.swift
//  Character
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import SwiftUI

final class AppCoordinator: ObservableObject {
    func start() -> some View {
        CharactersCoordinator().start()
    }
}
