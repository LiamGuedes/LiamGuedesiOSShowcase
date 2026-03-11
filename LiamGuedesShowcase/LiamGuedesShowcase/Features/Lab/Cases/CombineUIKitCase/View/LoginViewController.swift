//
//  Untitled.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 05/03/26.
//

import UIKit
import Combine

class LoginViewController: UIViewController {
    
    private let viewModel = LoginViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.$isLoginEnabled
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isEnabled in
                self?.loginButton.isEnabled = isEnabled
                self?.loginButton.backgroundColor = isEnabled ? .systemBlue : .systemGray
            }
            .store(in: &cancellables)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if textField == emailTextField {
            viewModel.email = textField.text ?? ""
        } else if textField == passwordTextField {
            viewModel.password = textField.text ?? ""
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Combine Test"
        
        emailTextField.placeholder = "E-mail"
        emailTextField.borderStyle = .roundedRect
        emailTextField.autocapitalizationType = .none
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        passwordTextField.placeholder = "Password (Minimum 6)"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 8
        loginButton.isEnabled = false
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.widthAnchor.constraint(equalToConstant: 280),
            loginButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
