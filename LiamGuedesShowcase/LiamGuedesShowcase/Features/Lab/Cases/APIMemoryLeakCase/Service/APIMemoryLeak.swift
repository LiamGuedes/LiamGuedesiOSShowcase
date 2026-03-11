//
//  APIMemoryLeak.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 22/02/26.
//

import SwiftUI
import Combine

class APIMemoryLeak {
    deinit {
        print("APIMemoryLeak deinit")
    }
    
    var onPaymentSuccess: (() -> Void)?
    let service = APIService()
    var isLoading = false
    
    func performMemoryLeakPayment() {
        isLoading = true
        service.pay { result in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.isLoading = false
                switch result {
                case .success:
                    self.onPaymentSuccess?()
                case .failure:
                    break
                }
            }
        }
    }
    
    func performMemorySafePayment() {
        isLoading = true
        service.pay { [weak self] result in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
                guard let self else { return }
                self.isLoading = false
                switch result {
                case .success:
                    self.onPaymentSuccess?()
                case .failure:
                    break
                }
            }
        }
    }
}
