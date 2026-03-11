//
//  LeakingScenarioView.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 09/03/26.
//

import SwiftUI

struct LeakingScenarioView: View {
    @StateObject var vm = ToxicViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 60))
                .foregroundColor(.red)
            
            Text("Memory Leaking...")
                .font(.title)
                .bold()
            
            Text("When you return from this screen, check the console.\nYou will NOT see the '💀' prints at terminal.\nThis means that the objects are still alive and consuming RAM.")
                .multilineTextAlignment(.center)
                .padding()
                .background(Color.red.opacity(0.1))
                .cornerRadius(10)
        }
        .padding()
    }
}
