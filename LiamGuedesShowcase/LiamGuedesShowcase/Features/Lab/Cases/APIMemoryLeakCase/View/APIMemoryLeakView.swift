//
//  Untitled.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 09/03/26.
//

import SwiftUI

struct APIMemoryLeakView: View {
    var body: some View {
        List {
            Section(header: Text("Choose API Integration Leak Scenario")) {
                NavigationLink(destination: LeakingAPIView()) {
                    HStack {
                        Image(systemName: "xmark.octagon.fill").foregroundColor(.red)
                        VStack(alignment: .leading) {
                            Text("Leaking API")
                                .font(.headline)
                            Text("This will cause a memory leak")
                                .font(.subheadline)
                        }
                    }
                    
                }
                
                NavigationLink(destination: FixedLeakingAPIView()) {
                    HStack {
                        Image(systemName: "checkmark.shield.fill").foregroundColor(.green)
                        VStack(alignment: .leading) {
                            Text("Fixed Leaking API")
                                .font(.headline)
                            Text("This will not cause a memory leak")
                                .font(.subheadline)
                        }
                    }
                }
            }
            
            Section(footer: Text("Open the Xcode console to view the allocation logs.")){
                EmptyView()
            }
        }
        .navigationTitle("API Memory Leak Showcase")
    }
}
