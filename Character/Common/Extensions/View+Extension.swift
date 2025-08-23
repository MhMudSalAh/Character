//
//  View+Extension.swift
//  Character
//
//  Created by MhMuD SalAh on 23/08/2025.
//

import SwiftUI

public extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
