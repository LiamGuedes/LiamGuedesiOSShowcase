//
//  AlgorithmRunnerView.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 16/12/25.
//

import SwiftUI

struct AlgorithmRunnerView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.opacity(0.1).ignoresSafeArea()
                
                Text("LeetCode Problems")
                    .font(.title2)
            }
            .navigationTitle("Algorithms")
        }
    }
}
