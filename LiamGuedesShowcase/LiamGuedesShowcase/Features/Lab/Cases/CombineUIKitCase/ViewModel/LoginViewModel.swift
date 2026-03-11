//
//  Untitled.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 05/03/26.
//

import Combine

class LoginViewModel {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoginEnabled = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupValidation()
    }
    
    private func setupValidation() {
        Publishers.CombineLatest($email, $password)
            .map { email, password in
                let isEmailValid = email.contains("@") && email.contains(".")
                let isPasswordValid = password.count >= 6
                
                return isEmailValid && isPasswordValid
            }
            .assign(to: \.isLoginEnabled, on: self)
            .store(in: &cancellables)
    }
}
