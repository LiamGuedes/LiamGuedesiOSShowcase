//
//  SafeAPIServiceViewModel.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 09/03/26.
//

import Combine

class SafeAPIServiceViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var message: String = ""

    private let api = APIMemoryLeak()

    private func setupCallbacks() {
        api.onPaymentSuccess = { [weak self] in
            self?.message = "Payment succeeded (safe)"
        }
    }

    init() {
        print("SafeAPIServiceViewModel init")
        setupCallbacks()
    }

    deinit {
        print("SafeAPIServiceViewModel deinit")
    }

    func pay() {
        isLoading = true
        api.performMemorySafePayment()
    }
}
