//
//  LeakingAPIView.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 09/03/26.
//

import SwiftUI

struct LeakingAPIView: View {
    @StateObject private var viewModel = ToxicAPIServiceViewModel()

    var body: some View {
        VStack(spacing: 16) {
            if viewModel.isLoading {
                ProgressView("Processing payment...")
            }
            Text(viewModel.message).foregroundStyle(.secondary)
            Button("Pay (Leaky)") {
                viewModel.pay()
            }
            .buttonStyle(.borderedProminent)
            Text("Navigate back after tapping to observe whether view model deallocates.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding()
        .navigationTitle("Leaking API")
    }
}
