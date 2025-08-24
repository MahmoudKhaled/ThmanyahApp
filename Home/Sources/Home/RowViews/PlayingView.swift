//
//  PlayingView.swift
//  Home
//
//  Created by Mahmoud Khaled on 24/08/2025.
//

import SwiftUI

struct PlayingView: View {
    var duration: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "play.fill")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)

            Text(duration)
                .font(.caption2)
                .truncationMode(.middle)
                .foregroundColor(.white)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(.gray)
        .clipShape(Capsule())
        .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
    }
}
