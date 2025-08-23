//
//  Router.swift
//  Character
//
//  Created by MhMuD SalAh on 23/08/2025.
//

import SwiftUI

@MainActor
protocol Router: ObservableObject {
    associatedtype Destination: Hashable
    var path: NavigationPath { get set }
    var destinations: [Destination] { get set }
    
    associatedtype SheetDestination: Hashable = Never
    var sheet: SheetDestination? { get set }
    
    associatedtype FullDestination: Hashable = Never
    var fullScreen: FullDestination? { get set }
    
    func push(_ destination: Destination)
    func pop()
    func popToRoot()
    func popTo(_ destination: Destination)
    
    func presentSheet(_ destination: SheetDestination)
    func dismissSheet()
    
    func presentFullScreen(_ destination: FullDestination)
    func dismissFullScreen()
}

extension Router {
    var pathBinding: Binding<NavigationPath> {
        Binding(
            get: { self.path },
            set: { self.path = $0 }
        )
    }
    
    var sheetBinding: Binding<SheetDestination?> {
        Binding(
            get: { self.sheet },
            set: { self.sheet = $0 }
        )
    }
    
    func push(_ destination: Destination) {
        destinations.append(destination)
        path.append(destination)
    }
    
    func pop() {
        guard !destinations.isEmpty else { return }
        destinations.removeLast()
        path.removeLast()
    }
    
    func popToRoot() {
        destinations.removeAll()
        path = NavigationPath()
    }
    
    func popTo(_ destination: Destination) {
        guard let index = destinations.firstIndex(of: destination) else { return }
        let removeCount = destinations.count - index - 1
        guard removeCount > 0 else { return }
        destinations.removeLast(removeCount)
        path.removeLast(removeCount)
    }
    
    func presentSheet(_ destination: SheetDestination) {
        sheet = destination
    }
    
    func dismissSheet() {
        sheet = nil
    }
    
    func presentFullScreen(_ destination: FullDestination) {
        fullScreen = destination
    }
    
    func dismissFullScreen() {
        fullScreen = nil
    }
}

// MARK: - Router Sheet Extension

extension Router where SheetDestination == Never {
    var sheet: SheetDestination? {
        get { nil }
        set { }
    }
    
    func presentSheet(_ destination: SheetDestination) {}
    func dismissSheet() {}
}

// MARK: - Router Full Extension

extension Router where FullDestination == Never {
    var fullScreen: FullDestination? {
        get { nil }
        set { }
    }
    
    func presentFullScreen(_ destination: FullDestination) {}
    func dismissFullScreen() {}
}
