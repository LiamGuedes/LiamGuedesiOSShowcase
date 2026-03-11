//
//  FixedScenarioView.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 09/03/26.
//

import SwiftUI

struct FixedScenarioView: View {
    @StateObject var vm = SafeViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "leaf.fill")
                .font(.system(size: 60))
                .foregroundColor(.green)
            
            Text("Memory Safe")
                .font(.title)
                .bold()
            
            Text("Upon returning from this screen, check the console.\nYou will see the '♻️' prints.\nThis means, the memory has been returned to the system.")
                .multilineTextAlignment(.center)
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(10)
        }
        .padding()
    }
}
