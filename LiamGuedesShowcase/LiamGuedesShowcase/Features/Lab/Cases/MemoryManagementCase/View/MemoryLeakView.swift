//
//  MemoryManagement.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 16/12/25.
//

import SwiftUI

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

//#Preview {
//    NavigationView {
//        MemoryLeakView()
//    }
//}

