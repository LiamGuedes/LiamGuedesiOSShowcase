//
//  Theme+Tabbar.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 22/12/25.
//

import SwiftUI

extension Theme {
    func applyTabbar() -> UITabBarAppearance {
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
