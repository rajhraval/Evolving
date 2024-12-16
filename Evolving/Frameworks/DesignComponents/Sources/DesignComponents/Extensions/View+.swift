//
//  View+.swift
//  DesignComponents
//
//  Created by Raj Raval on 16/12/24.
//

import SwiftUI

public extension View {
    func navigationStyle() -> some View {
        self
            .toolbarBackground(.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }
}
