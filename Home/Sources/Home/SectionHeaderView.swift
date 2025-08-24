//
//  SectionHeaderView.swift
//  Home
//
//  Created by Mahmoud Khaled on 24/08/2025.
//

import SwiftUI
import Domain

private struct SharedSectionHeaderView: View {
    var headerModel: SectionEntity

    var body: some View {
        HStack {
            Text(headerModel.title)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.white)

            Spacer()

            Button(action: {
//                headerModel.onTapHandler?()
            }) {
                Image(systemName: "chevron.right")
                    .font(.title2)
                    .foregroundColor(.white)
                    .fontWeight(.medium)
            }
        }
    }
}
