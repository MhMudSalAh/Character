//
//  Coordinator.swift
//  Character
//
//  Created by MhMuD SalAh on 23/08/2025.
//

import SwiftUI

@MainActor
protocol Coordinator: Router {
    associatedtype Content: View
    func start(isPreview: Bool) -> Content
}
