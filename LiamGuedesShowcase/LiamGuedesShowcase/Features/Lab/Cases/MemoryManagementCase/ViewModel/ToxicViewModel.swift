//
//  ToxicViewModel.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 09/03/26.
//

import Foundation
import Combine

class ToxicViewModel: ObservableObject {
    var service: ToxicService?
    
    init() {
        print("🔴 [ToxicViewModel] INIT")
        self.service = ToxicService(name: "Memory Toxic View Model")
        self.service?.delegate = self
    }
    
    deinit {
        print("💀 [ToxicViewModel] DEINIT")
    }
}
