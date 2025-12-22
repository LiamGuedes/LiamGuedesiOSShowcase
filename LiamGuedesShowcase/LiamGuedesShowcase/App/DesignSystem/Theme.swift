//
//  Theme.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 22/12/25.
//

import SwiftUI

struct Theme {
    struct Color {
        // MARK:  Backgrounds
        static let backgroundPrimary = SwiftUI.Color.black
        static let backgroundSecondary = SwiftUI.Color(white: 0.1)
        
        // MARK: Surfaces (Cards, Modais, Lists)
        static let surfacePrimary = SwiftUI.Color(white: 0.15)
        static let surfaceSecondary = SwiftUI.Color(white: 0.2)
        
        // MARK: Brand / Actions
        static let actionPrimary = SwiftUI.Color(red: 0.5, green: 0.0, blue: 1.0)
        
        // MARK: Typography / Content
        static let textPrimary = SwiftUI.Color.white
        static let textSecondary = SwiftUI.Color(white: 0.7)
        
        // MARK: Status
        static let success = SwiftUI.Color.green
        static let warning = SwiftUI.Color.orange
        static let error = SwiftUI.Color.red
    }
    
    struct Font {
        static let h1 = SwiftUI.Font.system(size: 32, weight: .bold, design: .rounded)
        static let h2 = SwiftUI.Font.title2.bold()
        static let body = SwiftUI.Font.body
        static let caption = SwiftUI.Font.caption
    }
}

struct AppThemeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Theme.Color.backgroundPrimary)
            .preferredColorScheme(.dark)
            .foregroundColor(Theme.Color.textPrimary)
            .tint(Theme.Color.actionPrimary)
    }
}

extension View {
    func applyAppTheme() -> some View {
        modifier(AppThemeModifier())
    }
}
