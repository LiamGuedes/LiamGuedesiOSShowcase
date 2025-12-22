//
//  Theme+Tabbar.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 22/12/25.
//

import SwiftUI

extension Theme {
    
    // Notes for Myself:
    // When you have a utility class, it doesn't make sense to create a default function
    // because you would need to create an instance (in this case, a Theme with Init),
    // increasing CPU processing. For utility classes like this, use static properties.
    // This decreases CPU usage and avoids creating an instance on the Heap.
    
    static func applyTabbar() -> UITabBarAppearance {
        let appearance = UITabBarAppearance()
        
        appearance.configureWithDefaultBackground()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        
        appearance.backgroundColor = UIColor.black
        
        let itemAppearance = UITabBarItemAppearance()
        let unselectedColor = UIColor(Theme.Color.textSecondary)
        itemAppearance.normal.iconColor = unselectedColor
        itemAppearance.normal.titleTextAttributes = [
            .foregroundColor: unselectedColor
        ]
        
        let selectedColor = UIColor(Theme.Color.actionPrimary)
        itemAppearance.selected.iconColor = selectedColor
        itemAppearance.selected.titleTextAttributes = [
            .foregroundColor: selectedColor
        ]
        
        appearance.stackedLayoutAppearance = itemAppearance
        appearance.inlineLayoutAppearance = itemAppearance
        appearance.compactInlineLayoutAppearance = itemAppearance
        
        return appearance
    }
}
