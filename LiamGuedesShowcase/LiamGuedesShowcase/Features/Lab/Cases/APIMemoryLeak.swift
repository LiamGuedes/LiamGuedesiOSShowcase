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

class APIService {
    func pay(_ completion: @escaping (Result<Void, Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            DispatchQueue.main.async {
                completion(.success(()))
            }
        }
    }
}

// MARK: - 1. Cenário "Tóxico" (Strong Reference Cycle) ❌
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

// MARK: - 2. Cenário "Saudável" (Weak Reference) ✅
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

struct APIMemoryLeakView: View {
    var body: some View {
        List {
            Section(header: Text("Choose API Integration Leak Scenario")) {
                NavigationLink(destination: LeakingAPIView()) {
                    HStack {
                        Image(systemName: "xmark.octagon.fill").foregroundColor(.red)
                        VStack(alignment: .leading) {
                            Text("Leaking API")
                                .font(.headline)
                            Text("This will cause a memory leak")
                                .font(.subheadline)
                        }
                    }
                    
                }
                
                NavigationLink(destination: FixedLeakingAPIView()) {
                    HStack {
                        Image(systemName: "checkmark.shield.fill").foregroundColor(.green)
                        VStack(alignment: .leading) {
                            Text("Fixed Leaking API")
                                .font(.headline)
                            Text("This will not cause a memory leak")
                                .font(.subheadline)
                        }
                    }
                }
            }
            
            Section(footer: Text("Open the Xcode console to view the allocation logs.")){
                EmptyView()
            }
        }
        .navigationTitle("API Memory Leak Showcase")
    }
}

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
