//
//  View+Font.swift
//  DesignComponents
//
//  Created by Raj Raval on 16/12/24.
//

import SwiftUI

public extension View {

    func customNavigationTitle() -> some View {
        self.font(.customNavigationTitle)
     }

    func customTitle() -> some View {
        self.font(.customTitle)
     }      

    func customHeadline() -> some View {
        self.font(.customHeadline)
     }

    func customSubtitle() -> some View {
        self.font(.customSubtitle)
     }

    func customCaption() -> some View {
        self.font(.customCaption)
    }
}
