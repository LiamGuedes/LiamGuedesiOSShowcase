//
//  FixedLeakingAPIView.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 09/03/26.
//
import SwiftUI

struct FixedLeakingAPIView: View {
    @StateObject private var viewModel = SafeAPIServiceViewModel()

    var body: some View {
        VStack(spacing: 16) {
            if viewModel.isLoading {
                ProgressView("Processing payment...")
            }
            Text(viewModel.message).foregroundStyle(.secondary)
            Button("Pay (Safe)") {
                viewModel.pay()
            }
            .buttonStyle(.borderedProminent)
            Text("Navigate back after tapping to observe deallocation logs.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding()
        .navigationTitle("Fixed Leak")
    }
}
