//
//  SafeViewModel.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 09/03/26.
//

import Combine

class SafeViewModel: ObservableObject {
    var service: SafeService?
    
    init() {
        print("🟢 [SafeViewModel] INIT")
        self.service = SafeService(name: "Safe Service")
        self.service?.delegate = self
    }
    
    deinit {
        print("♻️ [SafeViewModel] Free Memory")
    }
}
