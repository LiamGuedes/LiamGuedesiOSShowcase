//
//  ToxicService.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 09/03/26.
//

import Foundation

class ToxicService {
    var name: String
    var delegate: ToxicViewModel?
    
    init(name: String) {
        self.name = name
        print("🔴 [ToxicService] \(name) INIT")
    }
    
    deinit {
        print("💀 [ToxicService] \(name) DEINIT")
    }
}
