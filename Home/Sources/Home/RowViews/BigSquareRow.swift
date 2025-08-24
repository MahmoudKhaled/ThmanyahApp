//
//  BigSquareRow.swift
//  Home
//
//  Created by Mahmoud Khaled on 24/08/2025.
//

import SwiftUI
import Domain

struct BigSquareRow: View {
    let items: [SectionItemEntity]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(items) { item in
                    BigSquareAudioBookItemView(item: item,
                                               size: .init(width: 300, height: 300)
                    )
                }
            }
        }
    }
}

// MARK: - Card

private struct BigSquareAudioBookItemView: View {
    let item: SectionItemEntity
    let size: CGSize

    private enum Constants {
        static let cornerRadius: CGFloat = 8
        static let frameScale: CGFloat = 0.75
        static let heightOffset: CGFloat = 50
        static let padding: CGFloat = 24
        static let bottomPadding: CGFloat = 32
    }

    var body: some View {
        ZStack {
            AsyncImageView(
                url: item.imageURL,
                size: .init(
                    width: size.width * Constants.frameScale,
                    height: size.width * Constants.frameScale - Constants.heightOffset
                )
            )

            HStack {
                VStack {
                    Spacer()
                    Text(item.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, Constants.padding)
                        .padding(.bottom, Constants.bottomPadding)
                }
                Spacer()
            }
        }
        .frame(
            width: size.width * Constants.frameScale,
            height: size.width * Constants.frameScale - Constants.heightOffset
        )
        .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius))
        .onTapGesture {
            
        }
    }
}

