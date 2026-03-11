//
//  ToxicAPIServiceViewModel.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 09/03/26.
//

import Combine

class ToxicAPIServiceViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var message: String = ""

    private let api = APIMemoryLeak()

    private func setupCallbacks() {
        api.onPaymentSuccess = {
            self.message = "Payment succeeded (leaky)"
        }
    }

    init() {
        print("ToxicAPIServiceViewModel init")
        setupCallbacks()
    }

    deinit {
        print("ToxicAPIServiceViewModel deinit")
    }

    func pay() {
        isLoading = true
        api.performMemoryLeakPayment()
    }
}
