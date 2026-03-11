//
//  LoginViewControllerWrapper.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 10/03/26.
//

import SwiftUI

struct LoginViewWrapper: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> LoginViewController {
        return LoginViewController()
    }
    
    func updateUIViewController(_ uiViewController: LoginViewController, context: Context) {
        // When I have to update and mantain interoperability between UIKit and SwiftUI, I can use this
    }
}
