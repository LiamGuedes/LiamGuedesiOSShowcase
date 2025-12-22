//
//  DesigndetailView.swift
//  LiamGuedesShowcase
//
//  Created by Willian Guedes on 16/12/25.
//

import SwiftUI

struct DesignDetailView: View {
    let topic: DesignTopic
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Image(systemName: topic.icon)
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                    Text(topic.title)
                        .font(.largeTitle)
                        .bold()
                }
                .padding(.all, 18)
                
                Divider()
                
                Text(LocalizedStringKey(topic.content))
                    .font(.body)
                    .lineSpacing(6)
            }
            .padding()
        }
        .navigationTitle("System Design Concepts")
        .navigationBarTitleDisplayMode(.inline)
    }
}
