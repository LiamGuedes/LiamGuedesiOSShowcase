//
//  MemoryManagement.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 16/12/25.
//

import SwiftUI
import Combine

// MARK: - 1. Cenário "Tóxico" (Strong Reference Cycle) ❌

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

// MARK: - 2. Cenário "Saudável" (Weak Reference) ✅
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

// MARK: - 3. A Tela de Demonstração (UI)

struct MemoryLeakView: View {
    var body: some View {
        List {
            Section(header: Text("Chose Memory Leak Scenary")) {
                
                NavigationLink(destination: LeakingScenarioView()) {
                    HStack {
                        Image(systemName: "xmark.octagon.fill")
                            .foregroundColor(.red)
                        VStack(alignment: .leading) {
                            Text("Retain Cycle (Memory Leak)")
                                .font(.headline)
                            Text("Strong <-> Strong")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                NavigationLink(destination: FixedScenarioView()) {
                    HStack {
                        Image(systemName: "checkmark.shield.fill")
                            .foregroundColor(.green)
                        VStack(alignment: .leading) {
                            Text("Weak Reference (Memory Safe)")
                                .font(.headline)
                            Text("Strong <-> Weak")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            
            Section(footer: Text("Open the Xcode console to view the allocation logs.")) {
                EmptyView()
            }
        }
        .navigationTitle("Memory Leak Showcase")
    }
}

// MARK: - Sub-Views (Para isolar o ciclo de vida)

struct LeakingScenarioView: View {
    @StateObject var vm = ToxicViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 60))
                .foregroundColor(.red)
            
            Text("Memory Leaking...")
                .font(.title)
                .bold()
            
            Text("When you return from this screen, check the console.\nYou will NOT see the '💀' prints at terminal.\nThis means that the objects are still alive and consuming RAM.")
                .multilineTextAlignment(.center)
                .padding()
                .background(Color.red.opacity(0.1))
                .cornerRadius(10)
        }
        .padding()
    }
}

struct FixedScenarioView: View {
    @StateObject var vm = SafeViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "leaf.fill")
                .font(.system(size: 60))
                .foregroundColor(.green)
            
            Text("Memory Safe")
                .font(.title)
                .bold()
            
            Text("Upon returning from this screen, check the console.\nYou will see the '♻️' prints.\nThis means, the memory has been returned to the system.")
                .multilineTextAlignment(.center)
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(10)
        }
        .padding()
    }
}

//#Preview {
//    NavigationView {
//        MemoryLeakView()
//    }
//}

