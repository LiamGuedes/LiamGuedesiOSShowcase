//
//  AlgorithmsView.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 16/12/25.
//

import SwiftUI

struct LabView: View {
    var body: some View {
        NavigationView {
            List {
                // MARK: Memory Management
                Section(header: Text("Memory Management")) {
                    NavigationLink(destination: MemoryLeakView()) {
                        Label {
                            Text("Retain Cycle (Leak)")
                        } icon: {
                            Image(systemName: "exclamationmark.triangle.fill")
                                                            .foregroundColor(.red)
                        }
                    }
                    
                    NavigationLink(destination: Text("Upcoming: Weak x Unowned")) {
                                            Label("Weak vs Unowned", systemImage: "link")
                                        }
                }
                
                // MARK: Concurrency
                Section(header: Text("Concurrency (GCD & Async/Await)")) {
                    NavigationLink(destination: Text("Race Condition Demo")) {
                        Label("Race Conditions", systemImage: "ant.fill")
                    }
                }
                
                // MARK: UIKIT Interoperability
                Section(header: Text("UIKit Integration")) {
                    NavigationLink(destination: Text("UIViewRepresentable")) {
                        Label("Interoperability between SwiftUI & UIKit", systemImage: "puzzlepiece")
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Lab")
        }
    }
}

//#Preview {
//    LabView()
//}
