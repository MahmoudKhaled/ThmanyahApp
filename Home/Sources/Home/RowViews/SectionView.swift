//
//  SectionViews.swift
//  Home
//
//  Created by Mahmoud Khaled on 24/08/2025.
//

import Domain
import SwiftUI

struct SectionView: View {
    let section: SectionEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Title
            HStack {
                Text(section.title)
                    .font(.title2)
                    .bold()
                    .foregroundColor(section.contentType.titleColor)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(section.contentType.titleColor)
            }
            .padding(.horizontal)
            
            // Layout type handling
            switch section.layoutType {
            case .square:
                SquareRowView(items: section.items)
            case .queue:
                QueueRowView(items: section.items)
            case .grid:
                GridRowView(items: section.items)
            case .bigSquare:
                BigSquareRow(items: section.items)
            default:
                SquareRowView(items: section.items)
            }
        }
    }
}

