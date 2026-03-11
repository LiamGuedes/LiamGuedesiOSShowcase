//
//  APIService.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 09/03/26.
//

import Combine
import Foundation

class APIService {
    func pay(_ completion: @escaping (Result<Void, Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            DispatchQueue.main.async {
                completion(.success(()))
            }
        }
    }
}
