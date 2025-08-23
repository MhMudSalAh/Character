//
//  View+onViewDidLoad.swift
//  Character
//
//  Created by MhMuD SalAh on 23/08/2025.
//

import SwiftUI

public extension View {
    func onViewDidLoad(action: @escaping () async -> Void) -> some View {
        modifier(ViewDidLoadModifier(action: action))
    }
}

public struct ViewDidLoadModifier: ViewModifier {
    @State private var viewDidLoad = false
    let action: () async -> Void

    public func body(content: Content) -> some View {
        content
            .task {
                if !viewDidLoad {
                    viewDidLoad = true
                    await action()
                }
            }
    }
}
