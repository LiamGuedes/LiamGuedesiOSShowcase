//
//  MainTabView.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 16/12/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Int = 0
    
    init() {
        UITabBar.appearance().standardAppearance = Theme().applyTabbar()
        UITabBar.appearance().scrollEdgeAppearance = Theme().applyTabbar()
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            LabView()
                .tabItem { Label("Lab", systemImage: "flask.fill") }
                .tag(0)
            
            SystemDesignView()
                .tabItem { Label("System Design", systemImage: "server.rack") }
                .tag(1)
            
            AlgorithmRunnerView()
                .tabItem { Label("Algorithms", systemImage: "function") }
                .tag(2)
        }.accentColor(Theme.Color.actionPrimary)
        
    }
}

#Preview {
    MainTabView().applyAppTheme()
}
