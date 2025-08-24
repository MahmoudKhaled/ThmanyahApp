//
//  SquareRowView.swift
//  Home
//
//  Created by Mahmoud Khaled on 24/08/2025.
//

import Domain
import SwiftUI

struct SquareRowView: View {
    let items: [SectionItemEntity]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(items) { item in
                    VStack(alignment: .leading) {
                        AsyncImage(url: item.imageURL) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .cornerRadius(12)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 150, height: 150)
                        }
                        Text(item.title)
                            .font(.headline)
                            .lineLimit(1)
                    }
                    .frame(width: 150)
                }
            }
            .padding(.horizontal)
        }
    }
}
