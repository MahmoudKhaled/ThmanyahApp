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

    private var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(items) { item in
                    QueueItemView(
                        item: item
                    ).frame(
                        width: screenWidth * 0.8,
                        height: 150
                    )
                }
            }
        }
    }
}

private struct QueueItemView: View {
    let item: SectionItemEntity

    var body: some View {
        HStack(spacing: 8) {
            AsyncImageView(
                url: item.imageURL,
                size: .init(
                    width: 150,
                    height: 100
                )
            )
            .padding(.leading, 16)
            .padding(.vertical, 16)

            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                Text(item.title)
                    .font(.caption2)
                    .foregroundColor(.white)
                    .lineLimit(2)

                // Time info
                VStack(alignment: .leading, spacing: 1) {
                    Text("3 hours ago") // Update this by BE
                    Text(item.duration.formatDuration())
                        .foregroundColor(.white)
                }
                .font(.caption)
                .foregroundStyle(.white)

                HStack {
                    Spacer()
                    QueuePlayerICon {
                        print("Play")
                    }
                }.padding(.bottom, 8).padding(.trailing, 8)
            }
        }
        .background(Color(#colorLiteral(red: 0.03116153181, green: 0.04844073206, blue: 0.1671950221, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding()
        .shadow(radius: 6)
    }
}

private struct QueuePlayerICon: View {
    let onPlayerHandler: (() -> Void)?

    var body: some View {
        // Play button
        Button(action: {
            onPlayerHandler?()
        }) {
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 30, height: 30)

                Image(systemName: "play.fill")
                    .font(.system(size: 24))
                    .foregroundColor(.black)
                    .offset(x: 2)
            }
        }
    }
}

