//
//  QueueRowView.swift
//  Home
//
//  Created by Mahmoud Khaled on 24/08/2025.
//

import Domain
import SwiftUI

struct QueueRowView: View {
    
    let items: [SectionItemEntity]
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(items) { item in
                HStack {
                    AsyncImage(url: item.imageURL) { image in
                        image.resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(8)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 60, height: 60)
                    }
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.subheadline)
                            .lineLimit(2)
                        Text("\(item.duration)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Image(systemName: "ellipsis")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
            }
        }
    }
}

