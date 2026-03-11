//
//  SafeService.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 09/03/26.
//

import Foundation

class SafeService {
    var name: String
    weak var delegate: SafeViewModel?
    
    init(name: String) {
        self.name = name
        print("🟢 [SafeService] \(name) INIT")
    }
    
    deinit {
        print("♻️ [SafeService] \(name) Free Memory")
    }
}
