//
//  AlgorithmsView.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 16/12/25.
//

import SwiftUI

struct SystemDesignView: View {
    let topics: [DesignTopic] = Bundle.main.decode([DesignTopic].self, from: "system_design_topics.json")
    
    var body: some View {
        NavigationView {
            List(topics) { topic in
                NavigationLink(destination: DesignDetailView(topic: topic)) {
                    HStack {
                        Image(systemName: topic.icon)
                            .foregroundColor(.blue)
                            .frame(width: 30)
                        
                        Text(topic.title)
                            .font(.headline)
                    }
                    .padding(.vertical, 4)
                }
            }
            .listStyle(.plain)
            .navigationTitle("System Design")
        }
    }
}
