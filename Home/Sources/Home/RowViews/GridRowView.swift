//
//  GridRowView.swift
//  Home
//
//  Created by Mahmoud Khaled on 24/08/2025.
//
import Domain
import SwiftUI


struct GridRowView: View {
    let items: [SectionItemEntity]
    private let rows: [GridItem] = [GridItem(.flexible()),
                                    GridItem(.flexible())]

    private var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 15) {
                ForEach(items) { item in
                    TwoLineGridItemView(item: item)
                }
            }
            .frame(maxHeight: .infinity)
        }
    }
}

// MARK: - Card

private struct TwoLineGridItemView: View {
    let item: SectionItemEntity

    var body: some View {
        HStack(spacing: 15) {
            AsyncImageView(url: item.imageURL, size: .init(width: 100, height: 100))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            TwoLineGridItemInfoView(item: item)
        }
        .onTapGesture {
            // Add action here
        }
    }
}

private struct TwoLineGridItemInfoView: View {
    var item: SectionItemEntity

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(item.duration)")
                .font(.caption)
                .foregroundColor(.gray)

            // Main title
            Text(item.title)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.white)

            // Bottom controls
            HStack {
                PlayingView(duration: item.duration.formatDuration())

                Spacer()

                // More options button (three dots)
                Button(action: {
                }) {
                    Image(systemName: "ellipsis")
                        .foregroundStyle(.white)
                }
                .padding(.leading, 20)

                Button(action: {
                   
                }) {
                    Image(systemName: "line.3.horizontal")
                        .foregroundStyle(.white)
                }
            }
        }
    }
}


